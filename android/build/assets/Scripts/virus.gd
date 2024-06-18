extends CharacterBody2D


var death = false

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var r = rng.randi_range(0,4)
	if r == 0:
		modulate = Color.RED
	if r == 1:
		modulate = Color.WHITE
	if r == 2:
		modulate = Color.BLUE
	if r == 3:
		modulate = Color.GREEN
	if r == 4:
		modulate = Color.PURPLE

func _on_touch_button_pressed():
	if death == false:
		$AnimationPlayer.play("Death")
		death = true
		GameManager.score +=1

func _physics_process(delta):
	if death == false:
		var direction =  GameManager.screenmiddle - global_position 
		
		velocity = direction * 4 * delta
		move_and_slide()


