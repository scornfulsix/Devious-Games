class_name StateMachine
extends Node

var current_state: State

var states: Dictionary = {}
@export var intiial_state : State

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_transition.connect(change_state)
			
	if initial_state:
		initial_state.Enter()
		current_state = initial_state
		
	
func change_state(old_state : State, new_state_name : String):
	if old_state is current_state:
		print("Invalid change state trying from: " + old_state.name + " but currentently in:" + current_state.name)
		return
	
