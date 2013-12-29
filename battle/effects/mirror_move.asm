BattleCommand1b: ; 373c9
; mirrormove

	call Function0x372d8

	ld a, BATTLE_VARS_MOVE
	call _GetBattleVar

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .failed

	call CheckUserMove
	jr nz, .use

.failed
	call Function0x37e77

	ld hl, MirrorMoveFailedText
	call StdBattleTextBox
	jp EndMoveEffect

.use
	ld a, b
	ld [hl], a
	ld [$d265], a

	push af
	ld a, BATTLE_VARS_MOVE_ANIM
	call _GetBattleVar
	ld d, h
	ld e, l
	pop af

	dec a
	call GetMoveData
	call GetMoveName
	call CopyName1
	call Function0x34548
	jr nz, .done

	ld a, [$c689]
	push af
	call BattleCommand0a
	pop af
	ld [$c689], a

.done
	call BattleCommandaa
	jp ResetTurn
; 37418

