extends "res://npc/item.gd"

func interact(player):
	Global.has_staff_fire = true
	Global.show_message("获得了火之魔法杖")
	super.interact(player)
