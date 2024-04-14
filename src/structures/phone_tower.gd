extends Sprite2D

var minion = preload("res://src/manipulatables/minions/minion.tscn")

var game_over = false

func _ready():
	for i in 5:
		instance(Vector2(randi() % 20 * i, (randi() % 20) * i +100))

func instance(pos) -> void:
	var instance = minion.instantiate()
	instance.position = pos
	add_child(instance)
		



func _on_timer_timeout():
	if not game_over:
		for i in 3:
			instance(Vector2(randi() % 20 + i, (randi() % 20 + i) + 100))
