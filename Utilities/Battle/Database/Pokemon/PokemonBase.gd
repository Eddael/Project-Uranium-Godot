extends Resource
#class_name PokemonBase

# The name of the pokemon
export(String) var name = "Orchynx"

# Pokedex ID#
export(int) var ID = 1

# The pokemon's type. If only one type use type1
export var type1 = Type.GRASS
export var type2 = Type.STEEL

# The pokemon's base stats (HP,Attack,Defense,Sp.Atack,Sp.Def,Speed)
export(int) var hp = 50
export(int) var attack = 55
export(int) var defense = 55
export(int) var sp_attack = 70
export(int) var sp_defense = 70
export(int) var speed = 50

# The pokemon's public and hidden abilities
export(String) var ability
export(String) var hidden_ability

# The pokemon's Effort Value Yeild
export(int) var ev_yield_hp = 0
export(int) var ev_yield_attack = 0
export(int) var ev_yield_defense = 0
export(int) var ev_yield_sp_attack = 1
export(int) var ev_yield_sp_defense = 0
export(int) var ev_yield_speed = 0

# The pokemon's base experience yield when defeated
export(int) var exp_yield : int = 70

# The pokemon's leveling rate
enum rate {SLOW, MEDIUM_SLOW, MEDIUM_FAST, FAST, ERRATIC, FLUCTUATING}
export(rate) var leveling_rate = rate.MEDIUM_FAST

# The pokemon's gender ratio male percentage.
export(float) var male_ratio = 87.5

# The pokemon's evolution level
export(int) var evolution_level = 28

# The pokemon's evolution ID
export(int) var evolution_ID = 2

# Moveset by leveling
var moveset = [
	MoveSet.new(1, "Scratch"),
	MoveSet.new(1, "Growl"),
	MoveSet.new(5, "Leech Seed"),
	MoveSet.new(9, "Vine Whip"),
	MoveSet.new(13, "Metal Claw"),
	MoveSet.new(18, "Hone Claws"),
	MoveSet.new(20, "Mega Drain"),
	MoveSet.new(25, "Iron Defense"),
	MoveSet.new(29, "Leaf Blade"),
	MoveSet.new(33, "Iron Tail"),
	MoveSet.new(37, "Synthesis"),
	MoveSet.new(41, "Energy Ball"),
	MoveSet.new(45, "Meteor Mash"),
]
