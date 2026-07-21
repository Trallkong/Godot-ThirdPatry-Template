# SkillSystem — AGENTS.md

## Project

Godot 4.7 project (`project.godot`). A skill system — purpose TBD (no scripts or scenes exist yet).

## Engine Config (non-default)

| Setting | Value |
|---|---|
| renderer | Forward Plus |
| driver (Windows) | d3d12 |
| physics (3D) | Jolt Physics |
| stretch mode | `canvas_items` + `expand` |

## State

**Empty repo.** No `.gd`, `.tscn`, `.tres`, or `.res` files exist yet. No build/test/lint tooling. No CI.

## Working Here

- Godot-specific tooling is available via the `godot_*` MCP tool set (add nodes, attach scripts, create scenes, etc.).
- Only Godot 4.4+ APIs are available (project targets 4.7).
- `.godot/` is gitignored — engine-generated files live there and must **not** be committed.
- Project uses Godot 4 `forward_plus` render mode; avoid compatibility-mode-only features.
- D3D12 on Windows — if testing on other platforms, verify driver fallback.
- This file should be kept in sync with the actual project state as scripts, scenes, and tooling are added.
