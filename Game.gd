extends Node

var cookies = 0
var xp = 0.5
var level = 1
const particle = preload("res://Particle.tscn")
const lvlupsound = preload("res://Levelup.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	_update_cookie_label()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Bluberri.rotate(delta * log(level + 1))
	pass

func _update_cookie_label():
	$UI/TopBar/Score.text = "Cookies: %s" % cookies;
	$UI/TopBar/Level.text = "Level: %s" % level;
	$UI/TopBar/ExpBar.value = xp;
	
func _on_ClickerButton_pressed():
	cookies += 1
	xp += ((1.0 / level * 25.0)) + 0.5;
	if xp >= 100.0:
		level += round(xp / 100.0)
		xp = 0
		play_sound()
	
	_update_cookie_label()
	_make_particle()
	# $Bluberri/Bleep.s
	pass # Replace with function body.

func _make_particle():
	var p = particle.instance()
	p.transform = $Bluberri.transform
	# p.rotation = 0
	add_child(p)

func play_sound():
	var l = lvlupsound.instance()
	add_child(l)
