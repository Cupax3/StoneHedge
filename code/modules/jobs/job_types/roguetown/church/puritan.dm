/datum/job/roguetown/puritan
	title = "Wytcher Captain"
	flag = PURITAN
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	allowed_sexes = list(MALE, FEMALE)
	spells = list (/obj/effect/proc_holder/spell/invoked/sacred_flame_rogue,new /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt)
	allowed_races = RACES_ALL_KINDSPLUS
	allowed_patrons = list(
		/datum/patron/old_god,
		/datum/patron/divine/astrata,
		/datum/patron/divine/noc,
		/datum/patron/divine/dendor,
		/datum/patron/divine/abyssor,
		/datum/patron/divine/ravox,
		/datum/patron/divine/necra,
		/datum/patron/divine/xylix,
		/datum/patron/divine/pestra,
		/datum/patron/divine/malum,
	) //gets set to old god anyways
	tutorial = "As an Witcher, you have been tasked with hunting the various monsters that haunt the dream dales. Using Magick, Faith and your Arsenal of Tools; you are the stuff of legends which must fight the forces of darkness."
	whitelist_req = FALSE

	outfit = /datum/outfit/job/roguetown/puritan
	display_order = JDO_PURITAN
	give_bank_account = 36
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/puritan
	name = "Witcher"
	jobtype = /datum/job/roguetown/puritan
	allowed_patrons = list(/datum/patron/old_god)

/datum/outfit/job/roguetown/puritan/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/clothing/neck/roguetown/psicross/silver
	shoes = /obj/item/clothing/shoes/roguetown/boots
	pants = /obj/item/clothing/under/roguetown/tights/black
	cloak = /obj/item/clothing/cloak/cape/puritan
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	backpack_contents = list(/obj/item/storage/keyring/puritan = 1, /obj/item/rogueweapon/huntingknife/idagger/silver = 2, /obj/item/storage/belt/rogue/pouch/coins/rich)
	beltr =  /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	head = /obj/item/clothing/head/roguetown/puritan
	gloves = /obj/item/clothing/gloves/roguetown/leather
	beltl = /obj/item/quiver/bolts
	beltr = /obj/item/rogueweapon/sword/rapier
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3 , TRUE)
		H.change_stat("strength", 2)
		H.change_stat("endurance", 2)
		H.change_stat("constitution", 3)
		H.change_stat("perception", 3)
		H.change_stat("intelligence", 3)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
	H.verbs |= /mob/living/carbon/human/proc/faith_test
	H.verbs |= /mob/living/carbon/human/proc/torture_victim
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
	H.cmode_music = 'sound/music/combat_clergy.ogg'

/mob/living/carbon/human/proc/torture_victim()
	set name = "Extract Confession"
	set category = "Inquisition"

	var/obj/item/grabbing/I = get_active_held_item()
	var/mob/living/carbon/human/H
	if(!istype(I) || !ishuman(I.grabbed))
		return
	H = I.grabbed
	if(H == src)
		to_chat(src, span_warning("I already torture myself."))
		return
	var/painpercent = (H.get_complex_pain() / (H.STAEND * 10)) * 100
	if(H.add_stress(/datum/stressevent/tortured))
		if(!H.stat)
			var/static/list/torture_lines = list(
				"CONFESS!",
				"TELL ME YOUR SECRETS!",
				"SPEAK!",
				"YOU WILL SPEAK!",
				"TELL ME!",
				"THE PAIN HAS ONLY BEGUN, CONFESS!",
			)
			say(pick(torture_lines), spans = list("torture"))
			if(painpercent >= 100)
				H.emote("painscream")
				H.confession_time("antag")
				return
	to_chat(src, span_warning("Not ready to speak yet."))

/mob/living/carbon/human/proc/faith_test()
	set name = "Test Faith"
	set category = "Inquisition"

	var/obj/item/grabbing/I = get_active_held_item()
	var/mob/living/carbon/human/H
	if(!istype(I) || !ishuman(I.grabbed))
		return
	H = I.grabbed
	if(H == src)
		to_chat(src, span_warning("I already torture myself."))
		return
	var/painpercent = (H.get_complex_pain() / (H.STAEND * 10)) * 100
	if(H.add_stress(/datum/stressevent/tortured))
		if(!H.stat)
			var/static/list/faith_lines = list(
				"DO YOU DENY THE GOODLY ORDER?",
				"WHO IS YOUR GOD?",
				"ARE YOU EVIL?",
				"WHO IS YOUR PATRON?",
			)
			say(pick(faith_lines), spans = list("torture"))
			if(painpercent >= 100)
				H.emote("painscream")
				H.confession_time("patron")
				return
	to_chat(src, span_warning("Not ready to speak yet."))

/mob/living/carbon/human/proc/confession_time(confession_type = "antag")
	var/timerid = addtimer(CALLBACK(src, PROC_REF(confess_sins)), 6 SECONDS, TIMER_STOPPABLE)
	var/responsey = alert(src, "Resist torture? (1 TRI)", "TORTURE", "Yes","No")
	if(!responsey)
		responsey = "No"
	if(SStimer.timer_id_dict[timerid])
		deltimer(timerid)
	else
		to_chat(src, span_warning("Too late..."))
		return
	if(responsey == "Yes")
		adjust_triumphs(-1)
		confess_sins(confession_type, resist = TRUE)
	else
		confess_sins(confession_type)

/mob/living/carbon/human/proc/confess_sins(confession_type = "antag", resist)
	var/static/list/innocent_lines = list(
		"I DON'T KNOW!",
		"STOP THE PAIN!!",
		"I DON'T DESERVE THIS!",
		"THE PAIN!",
		"I HAVE NOTHING TO SAY...!",
		"WHY ME?!",
	)
	if(!resist)
		var/list/confessions = list()
		switch(confession_type)
			if("patron")
				if(length(patron?.confess_lines))
					confessions += patron.confess_lines
			if("antag")
				for(var/datum/antagonist/antag in mind?.antag_datums)
					if(!length(antag.confess_lines))
						continue
					confessions += antag.confess_lines
		if(length(confessions))
			say(pick(confessions), spans = list("torture"))
			return
	say(pick(innocent_lines), spans = list("torture"))
