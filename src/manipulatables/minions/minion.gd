extends CharacterBody2D

#This is a code that will apply to all minons and intended to be inherited, etc.

#Also layer 3 is collision for the minions

#I do not know what layers we need to use for the floor and the walls etc of the game 

const SPEED: int = 150 

@export var mouse_location: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var stop_timer = $StopTimer

var selected: bool =  false
var target: Vector2 = Vector2.ZERO
var target_max: int = 1

const MOVE_THRESHOLD: float = 0.5
var last_position= Vector2.ZERO

func _ready():
	target = position

func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO
	if (position.distance_to(target) > target_max):
		velocity = position.direction_to(target) * SPEED 

	if (get_slide_collision_count() and stop_timer.is_stopped()):
		stop_timer.start()
		last_position = position
	move_and_slide()


func move_to(tar):
	target = tar

func select():
	selected = true
	$"Sprite(Placeholder)/Selector".visible = true
	
func deselect():
	selected = false
	$"Sprite(Placeholder)/Selector".visible = false
	

func _on_stop_timer_timeout():
	if get_slide_collision_count():
		if (last_position.distance_to(target) < position.distance_to(target) + MOVE_THRESHOLD):
			target = position
	
