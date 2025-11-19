extends CharacterBody2D
@onready var animation_tree: AnimationTree = $AnimationTree

@export var movement_speed: float = 250
var direction: Vector2

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction:
		velocity = direction * movement_speed
	else:
		velocity = Vector2.ZERO	

	move_and_slide()
	
func update_animation() -> void:
	if velocity == Vector2.ZERO:
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true
		
