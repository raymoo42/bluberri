extends KinematicBody2D

var speed =  Vector2(0,0)
var mult = 1000
var rot = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = Vector2(rand_range(-1,1) * mult, rand_range(0.3, 0.5) * mult * -5)
	rot = speed.length();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed.y = speed.y + delta * mult * 10
	speed = speed *0.97
	rot = rot * 0.97
	
	$Sprite.rotate(delta * rot / 100)
	
	var collision_info = move_and_collide(speed * delta)
	if collision_info:
		speed = speed.bounce(collision_info.normal)
		if (!self.is_on_floor()):
			$Bounce.play(0)
	pass


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.


func _on_Bounce_finished():
	$Bounce.stop()
	pass # Replace with function body.
