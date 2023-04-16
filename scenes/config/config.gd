extends Node

func _on_escape():
	get_tree().change_scene("res://scenes/menu/menu.tscn")

# Общее для кнопок
func button_down():
	$audio/click.play()

func mouse_entered():
	$audio/hover.play()

func _on_fullmode():
	OS.window_fullscreen = !OS.window_fullscreen

func _on_sensitivity():
	$control/sensitivity.text = str(" Sensitivity ", config.sensitivity)
	config.sensitivity += 0.05
	if config.sensitivity >= 2: config.sensitivity = 0.05
