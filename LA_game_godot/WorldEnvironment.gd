extends WorldEnvironment


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#reassign_colors()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

"func make_red(color_:Color):
	color_.h = 0
	return color_

func make_green(color_:Color):
	color_.h = 0.321
	return color_

func make_blue(color_:Color):
	color_.h = 0.585
	return color_

func reassign_colors():
	var current_color = environment.sky.sky_material.sky_top_color.sky_top_color
	var new_color = make_red(current_color)
	environment.sky.sky_material.sky_top_color = new_color
	
"



