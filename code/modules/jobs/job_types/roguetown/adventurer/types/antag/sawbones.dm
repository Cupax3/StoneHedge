/datum/advclass/sawbones // doctor class. like the pilgrim, but more evil
	name = "Sawbones"
	tutorial = "It was an accident! Your patient wasn't using his second kidney, anyway. After an unfortunate 'misunderstanding' with the town and your medical practice, you know practice medicine on the run with your new associates. Business has never been better!"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/bandit/sawbones
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/combat_bandit2.ogg'

/datum/outfit/job/roguetown/bandit/sawbones/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	head = /obj/item/clothing/head/roguetown/nightman
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/huntingknife/cleaver /// proper self defense an tree aquiring
	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(
		/obj/item/reagent_containers/glass/alembic = 1,
		/obj/item/storage/fancy/ifak = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 1,
		/obj/item/clothing/mask/rogue/physician = 1,
		/obj/item/storage/box/matches = 1, /// for carterizer and lantern.
		/obj/item/clothing/ring/lantern = 1,
		/obj/item/storage/fancy/skit = 1,
	)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/lumberjacking, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE) //needed for getting into hideout
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) //Given for consistency sake as the idol still provides scalemail.
	H.change_stat("strength", 3)
	H.change_stat("endurance", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("speed", 1)
	if(H.age == AGE_OLD)
		H.change_stat("speed", -1)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 1)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/docheal)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/stable)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/purge)
	H.verbs |= /mob/proc/haltyell
	H.ambushable = FALSE
