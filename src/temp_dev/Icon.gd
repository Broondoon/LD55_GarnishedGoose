extends Sprite2D

@export var speed = 400

@onready var char_body = get_parent()

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	char_body.velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	char_body.move_and_slide()
