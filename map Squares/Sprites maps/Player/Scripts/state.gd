class_name State extends Node
# Stores a refernce to the player that this state belongs too
static var player: Player


func _ready():
	pass # Replace with function body.


## what happens when player enters this state?
func Enter() -> void:
	pass
	
	
## what happens when player exit's this state?
func Exit() -> void:
	pass

func Process( _delta : float ) -> State:
	return null 
	
	
	
	
## what happens during the _physicas_process update in this state?
func Physics( _delta : float ) -> State:
	return null
	
	
	
func HandleInput ( _event: InputEvent ) -> State:
	return null
	
	
	
	
	
	
	
	
	
	
	
	
