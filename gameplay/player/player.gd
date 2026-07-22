class_name Player extends CharacterBody3D

@export var skin: CharacterSkin
@export var walk_speed: float = 3.0
@export var jump_force: float = 8.0
@export var camera_controller: CameraController

func _ready() -> void:
	GlobalVariable.current_player = self

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= get_gravity().length() * delta
	else:
		skin.is_jumping = false
			
	if Input.is_action_just_pressed("jump") and is_on_floor():
		skin.is_jumping = true
		velocity.y += jump_force
		
	
	var move_input := Input.get_vector("move_left", "move_right", "move_backward", "move_forward")
	
	var forward_direction := camera_controller.get_camera_forward_direction()
	var right_direction := camera_controller.get_camera_right_direction()
	
	var move_direction := move_input.x * right_direction + move_input.y * forward_direction
	
	if move_direction:
		velocity.x = move_direction.x * walk_speed
		velocity.z = move_direction.z * walk_speed
		skin.speed = walk_speed
	else:
		velocity.x = move_toward(velocity.x, 0.0, 10 * delta)
		velocity.z = move_toward(velocity.z, 0.0, 10 * delta)
		skin.speed = 0.0
		
	move_and_slide()
	
	if skin.speed > 0.1:
		if move_direction:
			var target_angle = Vector2(move_direction.x, move_direction.z).angle_to(Vector2.UP)
			rotation.y = lerp_angle(rotation.y, target_angle, 12.0 * delta)
