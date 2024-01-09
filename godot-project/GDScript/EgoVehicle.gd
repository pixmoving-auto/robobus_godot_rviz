extends Spatial

var ego_pose = EgoPose.new()
var vehicle_status = VehicleStatus.new()

func _ready():
	vehicle_status.subscribe("/vehicle/status/turn_indicators_status", false)

func _process(_delta):
	# Ego pose
	set_translation(ego_pose.get_ego_position())
	set_rotation(ego_pose.get_ego_rotation())

	# Indicators
	if(vehicle_status.has_new()):
		var right_light = get_node("EgoVehicleKinematicBody/VehicleBody/RootNode/TurnSignalR")
		if (vehicle_status.is_turn_on_right()):
			#right_light.turn_on()
			pass
			
		else:
			#right_light.turn_off()
			pass
			

		var left_light = get_node("EgoVehicleKinematicBody/VehicleBody/RootNode/TurnSignalL")
		if (vehicle_status.is_turn_on_left()):
			#left_light.turn_on()
			pass
		else:
			#left_light.turn_off()
			pass
		vehicle_status.set_old()



func _on_NightModeCheckButton_toggled(button_pressed):
	var head_light = get_node("EgoVehicleKinematicBody/VehicleBody/RootNode/HeadLight")
	var head_small_light = get_node("EgoVehicleKinematicBody/VehicleBody/RootNode/HeadSmallLight")
	var fog_light = get_node("EgoVehicleKinematicBody/VehicleBody/RootNode/FogLight")
	var brake_light = get_node("EgoVehicleKinematicBody/VehicleBody/RootNode/BrakeLight")
	var head_beam_light = get_node("EgoVehicleKinematicBody/HeadBeamLight")
	if (button_pressed):
		head_light.turn_on()
		head_small_light.turn_on()
		fog_light.turn_on()
		brake_light.night_light_turn_on()
		head_beam_light.turn_on()
	else:
		head_light.turn_off()
		head_small_light.turn_off()
		fog_light.turn_off()
		brake_light.night_light_turn_off()
		head_beam_light.turn_off()



# extends Spatial

# var ego_pose = EgoPose.new()
# var vehicle_status = VehicleStatus.new()

# var right_light = get_node("EgoVehicleKinematicBody/VehicleBody/RootNode/decoration_3001/MLoo618C070Ah2dt_body4_2002")
# var left_light = get_node("EgoVehicleKinematicBody/VehicleBody/RootNode/decoration_3001/MLoo618C070Ah2dt_body4002")

# var right_light_icon : TextureRectR
# var left_light_icon : TextureRectL
# var blink_duration : float = 0.5
# var is_blinking : bool = false

# func _ready():
# 	vehicle_status.subscribe("/vehicle/status/turn_indicators_status", false)
# 	right_light_icon = $Right
# 	left_light_icon = $Left
# 	#start_blink_animation()

# func start_blink_animation():
# 	# 检查是否正在进行闪烁动画
# 	if is_blinking:
# 		return

# 	var blink_tween1 = Tween.new()
# 	var blink_tween2 = Tween.new()

# 	add_child(blink_tween1)
# 	add_child(blink_tween2)

# 	blink_tween1.interpolate_property(right_light_icon, "modulate:a", 1.0, 0.0, blink_duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
# 	blink_tween1.start()

# 	blink_tween2.interpolate_property(left_light_icon, "modulate:a", 1.0, 0.0, blink_duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
# 	blink_tween2.start()

# 	# 设置状态为正在进行闪烁动画
# 	is_blinking = true

# func stop_blink_animation():
# 	right_light_icon.modulate.a = 1.0
# 	left_light_icon.modulate.a = 1.0

# 	# 停止并清理所有 Tween
# 	get_node("/root/tweens").queue_free()

# 	# 重置状态为非闪烁状态
# 	is_blinking = false

# func _process(_delta):
# 	# Ego pose
# 	set_translation(ego_pose.get_ego_position())
# 	set_rotation(ego_pose.get_ego_rotation())

# 	# Indicators
# 	if vehicle_status.has_new():
# 		if vehicle_status.is_turn_on_right():
# 			right_light.turn_on()
# 			start_blink_animation()
# 		else:
# 			right_light.turn_off()
# 			stop_blink_animation()

# 		if vehicle_status.is_turn_on_left():
# 			left_light.turn_on()
# 			start_blink_animation()
# 		else:
# 			left_light.turn_off()
# 			stop_blink_animation()

# 		vehicle_status.set_old()

# func _on_NightModeCheckButton_toggled(button_pressed):
# 	var lights = [
# 		"EgoVehicleKinematicBody/VehicleBody/RootNode/HeadLight",
# 		"EgoVehicleKinematicBody/VehicleBody/RootNode/HeadSmallLight",
# 		"EgoVehicleKinematicBody/VehicleBody/RootNode/FogLight",
# 		"EgoVehicleKinematicBody/VehicleBody/RootNode/BrakeLight",
# 		"EgoVehicleKinematicBody/HeadBeamLight"
# 	]

# 	for light_path in lights:
# 		var light = get_node(light_path)
# 		if button_pressed:
# 			light.turn_on()
# 		else:
# 			light.turn_off()
