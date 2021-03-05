extends Node

var cookies = 0
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
	

func _on_ClickerButton_pressed():
	cookies += 1
	_update_cookie_label()
	_make_particle()
	# $Bluberri/Bleep.s
	pass # Replace with function body.

func _make_particle():
	var p = particle.instance()
	p.transform = $Bluberri.transform
	# p.rotation = 0
	add_child(p)
