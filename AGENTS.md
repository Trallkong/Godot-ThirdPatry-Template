# SkillSystem — AGENTS.md

## Project

Godot 4.7 third-person 3D template (`project.godot`). Remote: `https://github.com/Trallkong/Godot-ThirdPatry-Template.git`.

## Engine Config (non-default)

| Setting | Value |
|---|---|
| renderer | Forward Plus |
| driver (Windows) | d3d12 |
| physics (3D) | Jolt Physics |
| stretch mode | `canvas_items` + `expand` |

## Architecture

| Path | Role |
|---|---|
| `world.tscn` | Main scene (environment, ground, lighting, player, camera) |
| `gameplay/player/` | `Player` (CharacterBody3D), `CharacterSkin` (Node3D, anim state machine) |
| `gameplay/camera/` | `CameraController` — third-person camera via PhantomCamera3D |
| `gameplay/global_variable/` | `GlobalVariable` autoload singleton (exposes `current_player`) |
| `addons/phantom_camera/` | Phantom Camera v0.11 (Cinemachine-like camera system) |

## Controls

- **WASD** — move (input actions: `move_*`)
- **Mouse** — look (pointer captured on start)
- **Scroll wheel** — zoom (camera spring length)
- **Space** — jump

## Animation

`character_skin.tscn` has an `AnimationTree` + `AnimationPlayer`. State machine states: `Idle`, `Walk`, `Jump`, `Jump_Start`, `Jump_Land`. Transitions driven by `CharacterSkin.speed` (>= 3 → Walk) and `is_jumping`.

## Working Here

- Godot MCP tool set available (`godot_*`).
- `.godot/` is gitignored — do not commit engine-generated files.
- `project.godot` is the only config source. No CI, tests, or linters exist.
- This file should be kept in sync as the project evolves.
