extends "res://npc/item.gd"

func interact(player):
	Global.has_staff_ice = true
	Global.show_message("获得了冰之魔法杖")
	super.interact(player)
