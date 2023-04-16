extends Node


func _on_play():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://scenes/levels/level0.tscn")

# Локальные для кнопок
func _on_config():
	get_tree().change_scene("res://scenes/config/config.tscn")

func _on_escape():
	get_tree().quit()

# Общее для кнопок
func button_down():
	$audio/click.play()

func mouse_entered():
	$audio/hover.play()
