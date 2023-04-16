extends Control

# Общее для кнопок
func button_down():
	$audio/click.play()

func mouse_entered():
	$audio/hover.play()

func _process(_delta):
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if Input.is_action_just_pressed("ui_cancel"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		visible = false
	else: 
		if Input.is_action_just_pressed("ui_cancel"):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		visible = true

func _on_play():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_escape():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene("res://scenes/menu/menu.tscn")

func _on_sensitivity():
	$control/sensitivity.text = str(" Sensitivity ", config.sensitivity)
	config.sensitivity += 0.05
	if config.sensitivity >= 2: config.sensitivity = 0.05
