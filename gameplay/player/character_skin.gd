@tool
class_name CharacterSkin extends Node3D

@onready var animation_tree: AnimationTree = $AnimationTree

@export var speed: float = 0.0:
	set(value):
		speed = value
		blend_to_value(speed)

@export var is_jumping: bool = false
	
var tween: Tween

func blend_to_value(value: float) ->void:
	if tween and tween.is_running():
		tween.kill()
		
	tween = create_tween()
	tween.tween_property(animation_tree, "parameters/StateMachine/MoveBlend/blend_position", value, 0.2)
