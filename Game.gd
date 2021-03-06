extends Node

var cookies = 0
var xp = 0.5
var level = 1
const particle = preload("res://Particle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	_update_cookie_label()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Bluberri.rotate(0.005)
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
		$UI/lvlupsound.play()
		
	_update_cookie_label()
	_make_particle()
	# $Bluberri/Bleep.s
	pass # Replace with function body.

func _make_particle():
	var p = particle.instance()
	p.transform = $Bluberri.transform
	# p.rotation = 0
	add_child(p)

func _on_lvlupsound_finished():
	print ("I stopped playing audio")
	$UI/lvlupsound.stop()
	pass # Replace with function body.
