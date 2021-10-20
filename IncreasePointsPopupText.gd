extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var points = 1

var targetPosition = -50
var duration = 1

func init(_points):
	points = _points

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "+ %d" % points
	
	var newPos = self.position
	newPos.y += targetPosition
	
	$Label/Tween.interpolate_property(self, "position", 
		self.position, newPos, duration,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT) 
	
	$Label/Tween.interpolate_property($Label, "modulate:a", 
		1.0, 0.0, duration,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT) 
	
	$Label/Tween.start()

func _process(delta):

	if (self.position.y < targetPosition):
		self.queue_free()
