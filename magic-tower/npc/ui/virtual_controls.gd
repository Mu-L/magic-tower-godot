extends Control

func _ready():
	# Make sure the controls are visible and enabled
	if has_node("Control"):
		$Control.visible = true
