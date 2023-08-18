extends CharacterBody2D

var speed = 200

func _physics_process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		save_game()
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	move_and_collide(velocity * delta)
	
func save_game():
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	if file:
		file.store_string("Insert your game data here")
		file.close()
		print("Game data saved!")
