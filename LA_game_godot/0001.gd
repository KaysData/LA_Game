extends Node3D

var change_color = func(color_: Color) -> Color: return color_
# Called when the node enters the scene tree for the first time.
func _ready():
	set_current_color("blue")
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
	
func set_current_color(color_name):
	if color_name == "blue":
		change_color = make_blue
	elif color_name == "red":
		change_color = make_red
	elif color_name == "green":
		change_color = make_green

func reassign_colors():
	var worldEnvironment = get_node("WorldEnvironment")
	var sky_material_ = worldEnvironment.environment.sky.sky_material
	
	#Gets current sky box color values 
	var current_sky_c = sky_material_.sky_top_color
	var current_sky_horizon_c = sky_material_.sky_horizon_color
	var current_ground_bottom_c = sky_material_.ground_bottom_color
	var current_ground_horizon_c = sky_material_.ground_horizon_color
	
	#Changes color values
	var new_sky_c = change_color.call(current_sky_c)
	var new_sky_horizon_c = change_color.call(current_sky_horizon_c)
	var new_ground_bottom_c = change_color.call(current_ground_bottom_c)
	var new_ground_horizon_c = change_color.call(current_ground_horizon_c)
	
	#Sets new sky box color values 
	sky_material_.sky_top_color = new_sky_c
	sky_material_.sky_horizon_color = new_sky_horizon_c
	sky_material_.ground_bottom_color = new_ground_bottom_c
	sky_material_.ground_horizon_color = new_ground_horizon_c
	
	#Gets, changes, and sets OmniLight color
	var local_light = get_node("OmniLight3D")
	var current_light_c = local_light.light_color
	var new_light_c = change_color.call(current_light_c)
	local_light.light_color = new_light_c
	
	
	"
	var counter = 0
	for material_ in material_list:
		var current_color = material_.sky_top_color
		var new_color = make_red(current_color)
		material_list[counter].sky_top_color = new_color
		counter += 1
	"
