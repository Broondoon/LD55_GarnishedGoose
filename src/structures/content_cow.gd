extends Sprite2D

@export var progress_speed = 5
@export var work_needed = 100
@export var work_init = 0

signal minion_entered()
signal content_created()

@onready var work_progress = work_init
@onready var num_working = 0

@onready var progress_bar = get_node("ProgressBar")

# Called when the node enters the scene tree for the first time.
func _ready():
	progress_bar.value = work_init


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (work_progress < work_needed):
		work_progress += num_working * progress_speed * delta
		progress_bar.value = (work_progress / work_needed) * 100
	elif (work_progress >= work_needed):
		finished_progress()


func _on_area_2d_area_entered(area):
	num_working += 1
	

func _on_area_2d_area_exited(area):
	num_working += 1


func finished_progress():
	emit_signal("content_created")
