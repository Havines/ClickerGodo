extends Control

signal UpdateUpgrade(value, price)

export (int) var Value = 1
export (int) var Price = 1
export (int) var Increase = 5

onready var main = get_node("/root/Main")

func _ready():
	connect("UpdateUpgrade", main, "UpdateUpgrade")
	UpdateLabels()

func Buy():
	if main.CountClick >= Price:
		$AnimationPlayer.play("pressed")
		emit_signal("UpdateUpgrade", Value, Price)
		Price += Increase
		UpdateLabels()

func UpdateLabels():
	$Panel/VBoxContainer/Label.text = "+" + str(Value)
	$Panel/VBoxContainer/Label2.text = str(Price)

func _on_Panel_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			Buy()
