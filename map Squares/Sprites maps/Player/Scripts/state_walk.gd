class_name State_walk extends State

@export var move_speed : float = 100.0

@onready var Idle : State = $"../Idle"
@onready var Attack : State = $"../Attack"

## what happens when player enters this state?
func Enter() -> void:
	player.UpdateAnimation("walk")
	pass
	
	
## what happens when player exit's this state?
func exit() -> void:
	pass

func Process( _delta : float ) -> State:
	if player.direction == Vector2.ZERO:
		return Idle

	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation("walk")
	return null
	
	
## what happens during the _physicas_process update in this state?
func Physics( _delta : float ) -> State:
	return null
	
	


	
func HandleInput ( _event: InputEvent ) -> State: 
	if _event.is_action_pressed("attack"):
		return Attack
	return null
	
	
	
	
	
	
	
	
	
	
	
	
