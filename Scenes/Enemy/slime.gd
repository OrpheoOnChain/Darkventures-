extends "res://Scripts/Enemy/enemy.gd"

const SPEED = 700

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	velocity.x = SPEED * current_direction * delta
	
	$AnimatedSprite2D.play("walk")
	move_and_slide()

func flip_direction():
	if current_direction == Direction.RIGHT:
		current_direction = Direction.LEFT
		$AnimatedSprite2D.flip_h = true
		$Area2D.scale.x = -1
	else:
		current_direction = Direction.RIGHT
		$AnimatedSprite2D.flip_h = false
		$Area2D.scale.x = 1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("tile"):
		flip_direction()
