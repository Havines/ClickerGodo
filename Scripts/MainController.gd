extends Control

var CountClick = 0
var CountInc = 0

func Click():
	CountClick += 1
	UpdateValue()

func UpdateUpgrade(_value, _price):
	UpdateValue()
	CountClick -= _price
	CountInc += _value
	UpdateValue()

func UpdateValue():
	$"HBoxContainer/UpgradeZone/VBoxContainer/Value".Update(CountClick)

func _on_Timer_timeout():
	UpdateValue()
	CountClick += CountInc
