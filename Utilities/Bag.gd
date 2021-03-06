extends Node2D
class_name Inventory

var ITEMS

enum OPTIONS{
	ITEMS,
	MEDICINE,
	BALLS
	TMs,
	BERRIES,
	BATTLE_ITEMS,
	KEY_ITEMS,
}

var current = OPTIONS.MEDICINE

func _ready():
	ITEMS = Items_database.new()
	update_data()
	update_detail()

func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		if current < OPTIONS.KEY_ITEMS:
			current += 1
		else:
			current = OPTIONS.ITEMS
		change_selected()
		update_detail()
		animate()
	elif Input.is_action_just_pressed("ui_left"):
		if current > OPTIONS.ITEMS:
			current -= 1
		else:
			current = OPTIONS.KEY_ITEMS
		change_selected()
		update_detail()
		animate()
	

func change_selected():
	match current:
		OPTIONS.ITEMS:
			$CurrentContainer.bbcode_text = "[center]Items"
			
			hide_all()
			$items/items.show()
			
			if $items/items.get_children().size() == 0:
				$empty_text.show()
				pass
			else:
				for c in $items/items.get_children():
					c.show()
		OPTIONS.MEDICINE:
			$CurrentContainer.bbcode_text = "[center]Medicine"
			
			hide_all()
			$items/medicine.show()
			if $items/medicine.get_children().size() == 0:
				$empty_text.show()
				pass
			else:
				for c in $items/medicine.get_children():
					c.show()
		OPTIONS.BALLS:
			$CurrentContainer.bbcode_text = "[center]Poké Balls"
			
			hide_all()
			$items/balls.show()
			if $items/balls.get_children().size() == 0:
				$empty_text.show()
				pass
			else:
				for c in $items/balls.get_children():
					c.show()
		OPTIONS.TMs:
			$CurrentContainer.bbcode_text = "[center]TMs & HMs"
			
			hide_all()
			$items/tms.show()
			
			if $items/tms.get_children().size() == 0:
				$empty_text.show()
				pass
			else:
				for c in $items/tms.get_children():
					c.show()
		OPTIONS.BERRIES:
			$CurrentContainer.bbcode_text = "[center]Berries"
			
			hide_all()
			$items/berries.show()
			if $items/berries.get_children().size() == 0:
				$empty_text.show()
				pass
			else:
				for c in $items/berries.get_children():
					c.show()
		OPTIONS.BATTLE_ITEMS:
			$CurrentContainer.bbcode_text = "[center]Battle Items"
			
			hide_all()
			$items/battle_items.show()
			if $items/battle_items.get_children().size() == 0:
				$empty_text.show()
				pass
			else:
				for c in $items/battle_items.get_children():
					c.show()
		OPTIONS.KEY_ITEMS:
			$CurrentContainer.bbcode_text = "[center]Key Items"
			
			hide_all()
			$items/key_items.show()
			if $items/key_items.get_children().size() == 0:
				$empty_text.show()
				pass
			else:
				for c in $items/key_items.get_children():
					c.show()


func animate():
	reset_frames()
	
	match current:
		OPTIONS.ITEMS:
			$containers/ITEMS.frame = 0
			yield(get_tree().create_timer(0.1), "timeout")
			$containers/ITEMS.frame = 1
			yield(get_tree().create_timer(0.1), "timeout")
			$containers/ITEMS.frame = 2
			yield(get_tree().create_timer(0.1), "timeout")
			return
		OPTIONS.MEDICINE:
			$containers/MEDICINE.frame = 0
			yield(get_tree().create_timer(0.1), "timeout")
			$containers/MEDICINE.frame = 1
			yield(get_tree().create_timer(0.1), "timeout")
			$containers/MEDICINE.frame = 2
			yield(get_tree().create_timer(0.1), "timeout")
			return
		OPTIONS.BALLS:
			$containers/BALLS.frame = 0
			yield(get_tree().create_timer(0.1), "timeout")
			$containers/BALLS.frame = 1
			yield(get_tree().create_timer(0.1), "timeout")
			$containers/BALLS.frame = 2
			yield(get_tree().create_timer(0.1), "timeout")
			return
		OPTIONS.TMs:
			$containers/TMs.frame = 0
			yield(get_tree().create_timer(0.1), "timeout")
			$containers/TMs.frame = 1
			yield(get_tree().create_timer(0.1), "timeout")
			$containers/TMs.frame = 2
			yield(get_tree().create_timer(0.1), "timeout")
			return
		OPTIONS.BERRIES:
			$containers/BERRIES.frame = 0
			yield(get_tree().create_timer(0.1), "timeout")
			$containers/BERRIES.frame = 1
			yield(get_tree().create_timer(0.1), "timeout")
			$containers/BERRIES.frame = 2
			yield(get_tree().create_timer(0.1), "timeout")
			return
		OPTIONS.BATTLE_ITEMS:
			$containers/BATTLE_ITEMS.frame = 0
			yield(get_tree().create_timer(0.1), "timeout")
			$containers/BATTLE_ITEMS.frame = 1
			yield(get_tree().create_timer(0.1), "timeout")
			$containers/BATTLE_ITEMS.frame = 2
			yield(get_tree().create_timer(0.1), "timeout")
			return
		OPTIONS.KEY_ITEMS:
			$containers/KEY_ITEMS.frame = 0
			yield(get_tree().create_timer(0.1), "timeout")
			$containers/KEY_ITEMS.frame = 1
			yield(get_tree().create_timer(0.1), "timeout")
			$containers/KEY_ITEMS.frame = 2
			yield(get_tree().create_timer(0.1), "timeout")
			return

func reset_frames():
	for c in $containers.get_children():
		c.frame = 0
	pass

func update_data():
	# setup items
	for c in $items/items.get_children():
		$items/items.remove_child(c)
	if !Global.items[0].empty():
		for i in Global.items[0]:
			if i is int:
				continue
			var base = $items/base_item_panel.duplicate()
			base.get_child(1).bbcode_text = i
			base.visible == true
			$items/items.add_child(base)
	
	# setup medicine
	for c in $items/medicine.get_children():
		$items/medicine.remove_child(c)
	if !Global.items[1].empty():
		for i in Global.items[1]:
			if i is int:
				continue
			var base = $items/base_item_panel.duplicate()
			base.get_child(1).bbcode_text = i
			base.show()
			$items/medicine.add_child(base)
	
	# setup balls
	for c in $items/balls.get_children():
		$items/balls.remove_child(c)
	if !Global.items[2].empty():
		for i in Global.items[2]:
			if i is int:
				continue
			var base = $items/base_item_panel.duplicate()
			base.get_child(1).bbcode_text = i
			base.show()
			$items/balls.add_child(base)
	
	# setup tms
	for c in $items/tms.get_children():
		$items/tms.remove_child(c)
	if !Global.items[3].empty():
		for i in Global.items[3]:
			if i is int:
				continue
			var base = $items/base_item_panel.duplicate()
			base.get_child(1).bbcode_text = i
			base.show()
			$items/tms.add_child(base)
	
	# setup berries
	for c in $items/berries.get_children():
		$items/berries.remove_child(c)
	if !Global.items[4].empty():
		for i in Global.items[4]:
			if i is int:
				continue
			var base = $items/base_item_panel.duplicate()
			base.get_child(1).bbcode_text = i
			base.show()
			$items/berries.add_child(base)
	
	# setup battle_items
	for c in $items/battle_items.get_children():
		$items/battle_items.remove_child(c)
	if !Global.items[5].empty():
		for i in Global.items[5]:
			if i is int:
				continue
			var base = $items/base_item_panel.duplicate()
			base.get_child(1).bbcode_text = i
			base.show()
			$items/battle_items.add_child(base)
	
	# setup key_items
	for c in $items/key_items.get_children():
		$items/key_items.remove_child(c)
	if !Global.items[6].empty():
		for i in Global.items[6]:
			if i is int:
				continue
			var base = $items/base_item_panel.duplicate()
			base.get_child(1).bbcode_text = i
			base.show()
			$items/key_items.add_child(base)

func update_detail():
	match current:
		OPTIONS.ITEMS:
			$Details/icon.texture = null
			$Details/name.text = ""
			$Details/quantity.text = ""
			$Details/text.text = ""
			pass
		OPTIONS.MEDICINE:
			$Details/icon.texture = load("res://graphics/Icons/Item170.png")
			$Details/name.text = Global.items[1][0]
			$Details/quantity.text = str("x ", Global.items[1][1])
			$Details/text.text = ITEMS.item_list[ITEMS.item_list.find(Global.items[1][0]) + 1]
			
		OPTIONS.BALLS:
			$Details/icon.texture = load("res://graphics/Icons/Item211.png")
			$Details/name.text = Global.items[2][0]
			$Details/quantity.text = str("x ", Global.items[2][1])
			$Details/text.text = ITEMS.item_list[ITEMS.item_list.find(Global.items[2][0]) + 1]
			pass
		OPTIONS.TMs:
			$Details/icon.texture = null
			$Details/name.text = ""
			$Details/quantity.text = ""
			$Details/text.text = ""
			pass
		OPTIONS.BERRIES:
			$Details/icon.texture = null
			$Details/name.text = ""
			$Details/quantity.text = ""
			$Details/text.text = ""
			pass
		OPTIONS.BATTLE_ITEMS:
			$Details/icon.texture = null
			$Details/name.text = ""
			$Details/quantity.text = ""
			$Details/text.text = ""
			pass
		OPTIONS.KEY_ITEMS:
			$Details/icon.texture = null
			$Details/name.text = ""
			$Details/quantity.text = ""
			$Details/text.text = ""
			pass
	
	pass

func remove_item(id, quantity):
	match ITEMS.item_list[ITEMS.item_list.find(id) + 3]:
		"Items":
			pass
		"Medicine":
			if Global.items[1][1] - quantity >= 0:
				Global.items[1][1] -= quantity
			pass
		"Balls":
			if Global.items[2][1] - quantity >= 0:
				Global.items[2][1] -= quantity
	pass


func hide_all():
	$empty_text.hide()
	for c in $items.get_children():
		c.hide()
