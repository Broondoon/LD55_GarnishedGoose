extends CharacterBody2D

#This is a code that will apply to all minons and intended to be inherited, etc.

#Also layer 3 is collision for the minions

#I do not know what layers we need to use for the floor and the walls etc of the game 

const SPEED = 50

@export var mouse_location: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * SPEED
	move_and_slide()
	
func make_path() -> void:
	nav_agent.target_position = get_global_mouse_position()
	# Will implement the stuff for getting the mouse position only on click
	# Will try to make this modular too, so that the code will know what layer it clicked on and react dependingly

func _on_timer_timeout():
	make_path()
