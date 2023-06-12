extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var is_tween_running = false

func _input(event):
	if event is InputEventMouseButton:
		if (event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
			if (is_tween_running == false):
				is_tween_running = true
				var tween = create_tween().set_parallel(false)
				var rotation_ = rotation_degrees + Vector3(0,90,0)
				tween.tween_property(self, "rotation_degrees", rotation_, 1).set_ease(Tween.EASE_IN_OUT)
				tween.finished.connect(on_tween_finished)
				
		if (event.button_index == MOUSE_BUTTON_RIGHT and 
			event.pressed):
			if (is_tween_running == false):
				is_tween_running = true
				var tween = create_tween().set_parallel(false)
				var rotation_ = self.rotation_degrees + Vector3(0,0,90)
				tween.tween_property(self, "rotation_degrees", rotation_, 1)\
				.set_ease(Tween.EASE_IN_OUT)
				tween.finished.connect(on_tween_finished)

func on_tween_finished():
	is_tween_running = false
