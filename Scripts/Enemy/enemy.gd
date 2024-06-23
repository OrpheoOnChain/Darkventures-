extends CharacterBody2D

const JUMP_VELOCITY = -400.0

enum State {
	WALK,
	ATTACK,
}

enum Direction {
	LEFT = -1,
	RIGHT = 1,
}

var current_state = State.WALK
var current_direction = Direction.RIGHT

var health: float

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func apply_damage(damage: float):
	health -= damage
	
func check_death() -> bool:
	return health <= 0

func _physics_process(delta: float) -> void:
	move_and_slide()
