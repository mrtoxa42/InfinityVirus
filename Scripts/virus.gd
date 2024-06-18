extends CharacterBody2D


var death = false
var touch = false

func _ready():
	GameManager.countvirus += 1
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var r = rng.randi_range(0,5)
	if r == 0:
		modulate = Color.YELLOW
	if r == 1:
		modulate = Color.WHITE
	if r == 2:
		modulate = Color.SKY_BLUE
	if r == 3:
		modulate = Color.GREEN
	if r == 4:
		modulate = Color.PURPLE
	if r == 5:
		modulate = Color.SPRING_GREEN

func _on_touch_button_pressed():
	if death == false:
		_Death()
func _Death():
		$AnimationPlayer.play("Death")
		death = true
		GameManager.score +=1
		GameManager.countvirus -=1
func _physics_process(delta):
	if death == false:
		var direction =  GameManager.screenmiddle - global_position 
		
		velocity = direction * 4 * delta
		move_and_slide()
		
		
		
func _input(event):
	if event.is_pressed() and event is InputEventScreenTouch:
		touch = true
	print(touch)
func _on_virus_area_mouse_entered():
		_Death()


func _on_virus_area_mouse_shape_entered(shape_idx):
	_Death()
