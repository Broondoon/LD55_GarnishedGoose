extends Node2D

var dragging: bool = false
var selected: Array = []
var drag_start: Vector2 = Vector2.ZERO
var select_rectangle: RectangleShape2D = RectangleShape2D.new()

@onready var select_draw = $SelectDraw

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		if event.is_pressed():
			for minion in selected:
				minion.collider.deselect()
			selected = []
			dragging = true
			drag_start = event.position
		elif dragging:
			dragging = false
			select_draw.update_status(drag_start, event.position, dragging)
			var drag_end = event.position
			select_rectangle.extents = abs((drag_end - drag_start) / 2)
			var space = get_world_2d().direct_space_state
			var query = PhysicsShapeQueryParameters2D.new()
			query.set_shape(select_rectangle)
			query.transform = Transform2D(0, (drag_end + drag_start) / 2)
			selected = space.intersect_shape(query)
			for minion in selected:
				minion.collider.select()
	if dragging:
		if event is InputEventMouseMotion:
			select_draw.update_status(drag_start, event.position, dragging)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_released():
			for minion in selected:
				minion.collider.move_to(event.position)

