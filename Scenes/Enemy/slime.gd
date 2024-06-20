extends "res://Scripts/Enemy/enemy.gd"

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	$AnimatedSprite2D.play("walk")
	move_and_slide()
