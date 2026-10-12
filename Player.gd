extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 30
const SPEED = 300
const JUMP_HEIGHT = -530

var motion = Vector2()
var life = 3

# warning-ignore:unused_argument
func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("move_right"):
		motion.x = SPEED
		$Sprite.play("run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		motion.x = -SPEED
		$Sprite.play("run")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("idle")
	
	if is_on_floor():
		if Input.is_action_pressed("move_up"):
			motion.y = JUMP_HEIGHT
	else:
		$Sprite.play("jump")
	
	motion = move_and_slide(motion, UP)


func _on_pes_body_entered(body):
	body.dano()
	motion.y = JUMP_HEIGHT

func _on_dano_body_entered(body):
	motion.y = -300
	get_node("danim").play("dano")
	life -= 1
	print(life)
	if life == 0:
		get_tree().change_scene("res://menu.tscn")
