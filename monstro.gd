extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.4



func _ready():
	$sprite.play("walk")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 200

func _process(delta):
	
	if(flip):
		$".".position.x += velocidade
		$sprite.flip_h = false
		if($".".position.x >= posicao_final):
			flip = false
			
	if(!flip):
		$".".position.x -= velocidade
		$sprite.flip_h = true
		if($".".position.x <= posicao_inicial):
			flip = true

func dano():
	get_node("anima").play("death")
	get_node("sprite").play("death")
func death():
	$".".queue_free()
