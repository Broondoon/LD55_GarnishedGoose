extends Node2D

var drag_start: Vector2 = Vector2.ZERO
var drag_end: Vector2 = Vector2.ZERO
var dragging: bool = false 

func _draw():
	if dragging:
		draw_rect(Rect2(drag_start, drag_end - drag_start), Color(1, 1, 1), false)

func update_status(start, end, drag):
	drag_start = start
	drag_end = end
	dragging = drag
	queue_redraw()
