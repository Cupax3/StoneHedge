
/obj/item/roguekey
	name = "key"
	desc = "An unremarkable iron key."
	icon_state = "iron"
	icon = 'icons/roguetown/items/keys.dmi'
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0.75
	throwforce = 0
	var/lockhash = 0
	var/lockid = null
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH|ITEM_SLOT_NECK
	drop_sound = 'sound/items/gems (1).ogg'
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/roguekey/Initialize()
	. = ..()
	if(lockid)
		if(GLOB.lockids[lockid])
			lockhash = GLOB.lockids[lockid]
		else
			lockhash = rand(100,999)
			while(lockhash in GLOB.lockhashes)
				lockhash = rand(100,999)
			GLOB.lockhashes += lockhash
			GLOB.lockids[lockid] = lockhash

/obj/item/lockpick
	name = "lockpick"
	desc = "A small, sharp piece of metal to aid opening locks in the absence of a key."
	icon_state = "lpick"
	icon = 'icons/roguetown/items/keys.dmi'
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0.75
	throwforce = 0
	max_integrity = 10
	picklvl = 1
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH|ITEM_SLOT_NECK
	destroy_sound = 'sound/items/pickbreak.ogg'

/obj/item/roguekey/lord
	name = "master key"
	desc = "The Monarch's key."
	icon_state = "bosskey"
	lockid = "lord"

/obj/item/roguekey/lord/pre_attack(target, user, params)
	. = ..()
	if(istype(target, /obj/structure/closet))
		var/obj/structure/closet/C = target
		if(C.masterkey)
			lockhash = C.lockhash
	if(istype(target, /obj/structure/mineral_door))
		var/obj/structure/mineral_door/D = target
		if(D.masterkey)
			lockhash = D.lockhash

/obj/item/roguekey/royal
	name = "Royal Key"
	desc = "The Key to the royal chambers. It even feels pretentious."
	icon_state = "ekey"
	lockid = "royal"

/obj/item/roguekey/prince_rooms
	name = "Princely Key"
	desc = "The Key to the heirs chambers."
	icon_state = "ekey"
	lockid = "prince"

/obj/item/roguekey/manor
	name = "manor key"
	desc = "This key will open any manor doors."
	icon_state = "mazekey"
	lockid = "manor"

/obj/item/roguekey/clinic
	name = "clinic key"
	desc = "This key will open the old clinic in the bog."
	icon_state = "mazekey"
	lockid = "vamp"

/obj/item/roguekey/tribe
	name = "bone key"
	desc = "This key is made of bone. It will open the tribal fort."
	icon_state = "cheesekey"
	lockid = "tribe"


/obj/item/roguekey/garrison
	name = "town watch key"
	desc = "This key belongs to the town guards."
	icon_state = "spikekey"
	lockid = "garrison"

/obj/item/roguekey/dungeon
	name = "dungeon key"
	desc = "This key should unlock the rusty bars and doors of the dungeon."
	icon_state = "rustkey"
	lockid = "dungeon"

/obj/item/roguekey/noble
	name = "Noble Manor key"
	desc = "This key should unlock the noble manor"
	icon_state = "rustkey"
	lockid = "nobleguest"

/obj/item/roguekey/vault
	name = "vault key"
	desc = "This key opens the mighty vault."
	icon_state = "cheesekey"
	lockid = "vault"

/obj/item/roguekey/councillor_rooms
	name = "councillor rooms key"
	desc = "This key opens the councillor's rooms."
	icon_state = "cheesekey"
	lockid = "councillor"

/obj/item/roguekey/judge
	name = "judge's key"
	desc = "This key belongs to the judge."
	icon_state = "cheesekey"
	lockid = "watchmen captain"

/obj/item/roguekey/merchant
	name = "merchant's key"
	desc = "A merchant's key."
	icon_state = "cheesekey"
	lockid = "merchant"

/obj/item/roguekey/shop
	name = "shop key"
	desc = "This key opens and closes a shop door."
	icon_state = "ekey"
	lockid = "shop"

/obj/item/roguekey/townie // For use in round-start available houses in town. Do not use default lockID.
	name = "town dwelling Key"
	desc = "The key of some townie's home. Hope it's not lost."
	icon_state ="brownkey"
	lockid = "townie"

/obj/item/roguekey/tavern
	name = "tavern key"
	desc = "This key should open and close any tavern door."
	icon_state = "hornkey"
	lockid = "tavern"

/obj/item/roguekey/velder
	name = "elder's key"
	desc = "This key should open and close the elder's home."
	icon_state = "brownkey"
	lockid = "velder"

/obj/item/roguekey/tavern/village
	lockid = "vtavern"

/obj/item/roguekey/roomi/village
	lockid = "vroomi"

/obj/item/roguekey/roomii/village
	lockid = "vroomii"

/obj/item/roguekey/roomiii/village
	lockid = "vroomiii"

/obj/item/roguekey/roomiv/village
	lockid = "vroomiv"

/obj/item/roguekey/roomv/village
	lockid = "vroomv"

/obj/item/roguekey/roomvi/village
	lockid = "vroomvi"

/obj/item/roguekey/roomi
	name = "room I key"
	desc = "The key to the first room."
	icon_state = "brownkey"
	lockid = "roomi"

/obj/item/roguekey/roomii
	name = "room II key"
	desc = "The key to the second room."
	icon_state = "brownkey"
	lockid = "roomii"

/obj/item/roguekey/roomiii
	name = "room III key"
	desc = "The key to the third room."
	icon_state = "brownkey"
	lockid = "roomiii"

/obj/item/roguekey/roomiv
	name = "room IV key"
	desc = "The key to the fourth room."
	icon_state = "brownkey"
	lockid = "roomiv"

/obj/item/roguekey/roomv
	name = "room V key"
	desc = "The key to the fifth room."
	icon_state = "brownkey"
	lockid = "roomv"

/obj/item/roguekey/roomvi
	name = "room VI key"
	desc = "The key to the sixth room."
	icon_state = "brownkey"
	lockid = "roomvi"

/obj/item/roguekey/roomhunt
	name = "room HUNT key"
	desc = "This is the HUNT key!"
	icon_state = "brownkey"
	lockid = "roomhunt"

//vampire mansion//
/obj/item/roguekey/vampire
	name = "mansion key"
	desc = "The key to a vampire lord's castle."
	icon_state = "vampkey"
	lockid = "mansionvampire"
//

/obj/item/roguekey/blacksmith
	name = "blacksmith key"
	desc = "This key opens a blacksmith's workshop."
	icon_state = "brownkey"
	lockid = "blacksmith"

/obj/item/roguekey/blacksmith/town
	name = "town blacksmith key"
	lockid = "townblacksmith"

/obj/item/roguekey/walls
	name = "walls key"
	desc = "This is a rusty key."
	icon_state = "rustkey"
	lockid = "walls"

/obj/item/roguekey/farm
	name = "farm key"
	desc = "This is a rusty key that'll open farm doors."
	icon_state = "rustkey"
	lockid = "farm"

/obj/item/roguekey/veteran
	name = "guildmaster key"
	desc = "This key is for adventurer's guild."
	icon_state = "ekey"
	lockid = "veteran"

/obj/item/roguekey/butcher
	name = "butcher key"
	desc = "This is a rusty key that'll open butcher doors."
	icon_state = "rustkey"
	lockid = "butcher"

/obj/item/roguekey/church
	name = "church key"
	desc = "This bronze key should open almost all doors in the church."
	icon_state = "brownkey"
	lockid = "church"

/obj/item/roguekey/priest
	name = "priest's key"
	desc = "This is the master key of the church."
	icon_state = "cheesekey"
	lockid = "Archpriest"

/obj/item/roguekey/tower
	name = "tower key"
	desc = "This key should open anything within the tower."
	icon_state = "greenkey"
	lockid = "tower"

/obj/item/roguekey/mage
	name = "magicians's key"
	desc = "This is the court wizard's key. It watches you..."
	icon_state = "eyekey"
	lockid = "mage"

/obj/item/roguekey/graveyard
	name = "crypt key"
	desc = "This rusty key belongs to the gravekeeper."
	icon_state = "rustkey"
	lockid = "graveyard"

/obj/item/roguekey/mason
	name = "mason's key"
	desc = "This bronze key should open the mason's guild."
	icon_state = "brownkey"
	lockid = "mason"

/obj/item/roguekey/nightman
	name = "nightmaster's key"
	desc = "This regal key opens a few doors within the castle."
	icon_state = "greenkey"
	lockid = "nightman"

/obj/item/roguekey/nightmaiden
	name = "nightmaiden's key"
	desc = "This regal key opens a few doors within the castle."
	icon_state = "brownkey"
	lockid = "nightmaiden"

/obj/item/roguekey/mercenary
	name = "mercenary key"
	desc = "Why, a mercenary would not kick doors down."
	icon_state = "greenkey"
	lockid = "merc"

/obj/item/roguekey/physician
	name = "physician key"
	desc = "The key smells of herbs, feeling soothing to the touch."
	icon_state = "greenkey"
	lockid = "physician"

/obj/item/roguekey/puritan
	name = "puritan's key"
	desc = "This is an intricate key." // i have no idea what is this key about
	icon_state = "mazekey"
	lockid = "puritan"

/obj/item/roguekey/confession
	name = "confessional key"
	desc = "This key opens the doors of the confessional."
	icon_state = "brownkey"
	lockid = "confession"

/obj/item/roguekey/hand
	name = "hand's key"
	desc = "This regal key belongs to the Monarch's Right Hand."
	icon_state = "cheesekey"
	lockid = "hand"

/obj/item/roguekey/steward
	name = "steward's key"
	desc = "This key belongs to the court's greedy steward."
	icon_state = "cheesekey"
	lockid = "steward"

/obj/item/roguekey/archive
	name = "archive key"
	desc = "This key looks barely used."
	icon_state = "ekey"
	lockid = "archive"

/obj/item/roguekey/manor
	name = "manor key"
	desc = "This key will open any manor doors."
	icon_state = "mazekey"
	lockid = "manor"

/obj/item/roguekey/bog_gatehouse
	name = "bog gatehouse key"
	desc = "This key opens the bog gatehouse."
	icon_state = "spikekey"
	lockid = "bog_gatehouse"

/obj/item/roguekey/bog_barracks
	name = "bog barracks key"
	desc = "This key opens the bog barracks."
	icon_state = "spikekey"
	lockid = "bog_barracks"

/obj/item/roguekey/bog_dungeon
	name = "bog dungeon key"
	desc = "This key opens the bog dungeon."
	icon_state = "spikekey"
	lockid = "bog_dungeon"

/obj/item/roguekey/bog_armory
	name = "bog armory key"
	desc = "This key opens the bog armory."
	icon_state = "spikekey"
	lockid = "bog_armory"

/obj/item/roguekey/town_barracks
	name = "town barracks key"
	desc = "This key opens the town barracks."
	icon_state = "spikekey"
	lockid = "town_barracks"

/obj/item/roguekey/town_dungeon
	name = "town dungeon key"
	desc = "This key opens the town dungeon."
	icon_state = "spikekey"
	lockid = "town_dungeon"

/obj/item/roguekey/town_armory
	name = "town armory key"
	desc = "This key opens the town armory."
	icon_state = "spikekey"
	lockid = "town_armory"

/obj/item/roguekey/sheriff_office
	name = "sheriff's office key"
	desc = "This key opens the sheriff's office."
	icon_state = "spikekey"
	lockid = "sheriff_office"

/obj/item/roguekey/keep_gatehouse
	name = "keep gatehouse key"
	desc = "This key opens the keep gatehouse."
	icon_state = "spikekey"
	lockid = "keep_gatehouse"

/obj/item/roguekey/keep_barracks
	name = "keep barracks key"
	desc = "This key opens the keep barracks."
	icon_state = "spikekey"
	lockid = "keep_barracks"

/obj/item/roguekey/keep_dungeon
	name = "keep dungeon key"
	desc = "This key opens the keep dungeon."
	icon_state = "spikekey"
	lockid = "keep_dungeon"

/obj/item/roguekey/keep_dungeon_torture
	name = "keep dungeon torture room key"
	desc = "This key opens the keep dungeon torture room."
	icon_state = "spikekey"
	lockid = "keep_dungeon_torture"

/obj/item/roguekey/keep_armory
	name = "keep armory key"
	desc = "This key opens the keep armory."
	icon_state = "spikekey"
	lockid = "keep_armory"

//grenchensnacker
/obj/item/roguekey/porta
	name = "strange key"
	desc = "Was this key enchanted by a wizard locksmith...?"//what is grenchensnacker.
	icon_state = "eyekey"
	lockid = "porta"

/obj/item/roguekey/blk
	name = "Blackmarket Key"
	desc = "Hm. Sinister."
	icon_state = "toothkey"
	lockid = "blk"

//custom key
/obj/item/roguekey/custom
	name = "custom key"
	desc = "A custom key designed by a blacksmith."
	icon_state = "brownkey"

/obj/item/roguekey/custom/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/hammer))
		var/input = (input(user, "What would you name this key?", "", "") as text)
		if(input)
			name = input + " key"
			to_chat(user, span_notice("You rename the key to [name]."))

//custom key blank
/obj/item/customblank //i'd prefer not to make a seperate item for this honestly
	name = "blank custom key"
	desc = "A key without its teeth carved in. Endless possibilities..."
	icon = 'icons/roguetown/items/keys.dmi'
	icon_state = "brownkey"
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0.75
	var/lockhash = 0

/obj/item/customblank/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/hammer))
		var/input = input(user, "What would you like to set the key ID to?", "", 0) as num
		input = max(0, input)
		to_chat(user, span_notice("You set the key ID to [input]."))
		lockhash = 10000 + input //having custom lock ids start at 10000 leaves it outside the range that opens normal doors, so you can't make a key that randomly unlocks existing key ids like the church

/obj/item/customblank/attack_right(mob/user)
	if(istype(user.get_active_held_item(), /obj/item/roguekey))
		var/obj/item/roguekey/held = user.get_active_held_item()
		src.lockhash = held.lockhash
		to_chat(user, span_notice("You trace the teeth from [held] to [src]."))
	else if(istype(user.get_active_held_item(), /obj/item/customlock))
		var/obj/item/customlock/held = user.get_active_held_item()
		src.lockhash = held.lockhash
		to_chat(user, span_notice("You fine-tune [src] to the lock's internals."))
	else if(istype(user.get_active_held_item(), /obj/item/rogueweapon/hammer) && src.lockhash != 0)
		var/obj/item/roguekey/custom/F = new (get_turf(src))
		F.lockhash = src.lockhash
		F.lockid = lockhash
		to_chat(user, span_notice("You finish [F]."))
		qdel(src)


//custom lock unfinished
/obj/item/customlock
	name = "unfinished lock"
	desc = "A lock without its pins set. Endless possibilities..."
	icon = 'icons/roguetown/items/keys.dmi'
	icon_state = "lock"
	w_class = WEIGHT_CLASS_SMALL
	dropshrink = 0.75
	var/lockhash = 0

/obj/item/customlock/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/hammer))
		var/input = input(user, "What would you like to set the lock ID to?", "", 0) as num
		input = max(0, input)
		to_chat(user, span_notice("You set the lock ID to [input]."))
		lockhash = 10000 + input //same deal as the customkey
	else if(istype(I, /obj/item/roguekey))
		var/obj/item/roguekey/ID = I
		if(ID.lockhash == src.lockhash)
			to_chat(user, span_notice("[I] twists cleanly in [src]."))
		else
			to_chat(user, span_warning("[I] jams in [src],"))
	else if(istype(I, /obj/item/customblank))
		var/obj/item/customblank/ID = I
		if(ID.lockhash == src.lockhash)
			to_chat(user, span_notice("[I] twists cleanly in [src].")) //this makes no sense since the teeth aren't formed yet but i want people to be able to check whether the locks theyre making actually fit
		else
			to_chat(user, span_warning("[I] jams in [src]."))

/obj/item/customlock/attack_right(mob/user)
	if(istype(user.get_active_held_item(), /obj/item/roguekey))//i need to figure out how to avoid these massive if/then trees, this sucks
		var/obj/item/roguekey/held = user.get_active_held_item()
		src.lockhash = held.lockhash
		to_chat(user, span_notice("You align the lock's internals to [held].")) //locks for non-custom keys
	else if(istype(user.get_active_held_item(), /obj/item/customblank))
		var/obj/item/customblank/held = user.get_active_held_item()
		src.lockhash = held.lockhash
		to_chat(user, span_notice("You align the lock's internals to [held]."))
	else if(istype(user.get_active_held_item(), /obj/item/rogueweapon/hammer) && src.lockhash != 0)
		var/obj/item/customlock/finished/F = new (get_turf(src))
		F.lockhash = src.lockhash
		to_chat(user, span_notice("You finish [F]."))
		qdel(src)

//finished lock
/obj/item/customlock/finished
	name = "lock"
	desc = "A customized iron lock that is used by keys."
	var/holdname = ""

/obj/item/customlock/finished/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/hammer))
		src.holdname = input(user, "What would you like to name this?", "", "") as text
		if(holdname)
			to_chat(user, span_notice("You label the [name] with [holdname]."))
	else
		..()

/obj/item/customlock/finished/attack_right(mob/user)//does nothing. probably better ways to do this but whatever

/obj/item/customlock/finished/attack_obj(obj/structure/K, mob/living/user)
	if(istype(K, /obj/structure/closet))
		var/obj/structure/closet/KE = K
		if(KE.keylock == TRUE)
			to_chat(user, span_warning("[K] already has a lock."))
		else
			KE.keylock = TRUE
			KE.lockhash = src.lockhash
			KE.lock_strength = 100
			if(src.holdname)
				KE.name = (src.holdname + " " + KE.name)
			to_chat(user, span_notice("You add [src] to [K]."))
			qdel(src)
	if(istype(K, /obj/structure/mineral_door))
		var/obj/structure/mineral_door/KE = K
		if(KE.can_add_lock)
			if(KE.keylock == TRUE)
				to_chat(user, span_warning("[K] already has a lock."))
			else
				KE.keylock = TRUE
				KE.lockhash = src.lockhash
				KE.lock_strength = 100
				if(src.holdname)
					KE.name = src.holdname
				to_chat(user, span_notice("You add [src] to [K]."))
				qdel(src)
		else
			KE.keylock = TRUE
			KE.lockhash = src.lockhash
			KE.lock_strength = 100
			if(src.holdname)
				KE.name = src.holdname
			to_chat(user, span_notice("You add [src] to [K]."))
			qdel(src)
