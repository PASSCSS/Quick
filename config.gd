extends Node

var sensitivity : float = 0.4

func dead():
	get_tree().reload_current_scene()
