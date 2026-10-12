extends Area2D

export(String, FILE, "*.tscn") var passar

func _on_passagem_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(passar)
