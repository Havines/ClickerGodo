extends Control

signal Click()

func _ready():
	var main = get_node("/root/Main")
	connect("Click", main, "Click")


func _on_Panel_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			emit_signal("Click")
			$AnimationPlayer.play("Click")
			$AnimationPlayer.queue("idle")
