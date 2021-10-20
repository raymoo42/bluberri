extends Node

var berries = 0
var xp = 0.5
var level = 1
const particle = preload("res://Particle.tscn")
const berryIncreasePopup = preload("res://IncreasePointsPopupText.tscn")
const lvlupsound = preload("res://Levelup.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	_update_cookie_label()
	_update_level_label()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Bluberri.rotate(delta * log(level + 1))
	pass

func _update_cookie_label():
	$UI/TopBar/Score.text = "Berries: %s" % berries;

func _update_level_label():
	$UI/TopBar/Level.text = "Level: %s" % level;	
	$UI/TopBar/ExpBar.value = xp;

		
func _on_ClickerButton_pressed():
	_increase_berry_count(1)
	_increase_xp()	
	
	_make_particle()
	# $Bluberri/Bleep.s
	pass # Replace with function body.

func _increase_berry_count(count):
	berries += count
	_update_cookie_label()
	pass	

func _increase_xp():
	xp += ((1.0 / level * 25.0)) + 0.5;
	if xp >= 100.0:
		level += round(xp / 100.0)
		xp = 0
		play_sound()
	# Update level in UI
	$UI/TopBar/Level.text = "Level: %s" % level;	
	$UI/TopBar/ExpBar.value = xp;

func _make_particle():
	var p = particle.instance()
	p.transform = $Bluberri.transform
	add_child(p)

func play_sound():
	var l = lvlupsound.instance()
	add_child(l)


func _on_AutoIncrementer_timeout():
	var berries_delta = get_background_berry_production_amount()
	if (berries_delta > 0):
		_increase_berry_count(berries_delta)
		_show_berryup_popup(berries_delta)
	pass
	
func _show_berryup_popup(amount):
	var newInstance = berryIncreasePopup.instance()
	newInstance.init(amount)
	$UI/TopBar/SpawnIncrement.add_child(newInstance)

func get_background_berry_production_amount():
	return level
