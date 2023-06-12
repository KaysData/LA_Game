extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	reassign_colors()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func make_red(color_:Color):
	color_.h = 0
	return color_

func make_green(color_:Color):
	color_.h = 0.321
	return color_

func make_blue(color_:Color):
	color_.h = 0.585
	return color_

func reassign_colors():
	var worldEnvironment = get_node("WorldEnvironment")
	var current_color = worldEnvironment.environment.sky.sky_material.sky_top_color

	var new_color = make_red(current_color)
	worldEnvironment.environment.sky.sky_material.sky_top_color = new_color
	"
	var counter = 0
	for material_ in material_list:
		var current_color = material_.sky_top_color
		var new_color = make_red(current_color)
		material_list[counter].sky_top_color = new_color
		counter += 1
	"
