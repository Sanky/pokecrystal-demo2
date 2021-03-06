INCLUDE "includes.asm"


SECTION "Events", ROMX, BANK[EVENTS]

OverworldLoop: ; 966b0
	xor a
	ld [MapStatus], a
.loop
	ld a, [MapStatus]
	ld hl, .jumps
	rst JumpTable
	ld a, [MapStatus]
	cp 3 ; done
	jr nz, .loop
.done
	ret

.jumps
	dw StartMap
	dw EnterMap
	dw HandleMap
	dw .done
; 966cb


Function966cb: ; 966cb
	xor a
	ld [ScriptFlags3], a
	ret
; 966d0

Function966d0: ; 966d0
	ld a, $ff
	ld [ScriptFlags3], a
	ret
; 966d6

Function966d6: ; 966d6
	ld hl, ScriptFlags3
	bit 5, [hl]
	ret
; 966dc

Function966dc: ; 966dc
	ld hl, ScriptFlags3
	res 2, [hl]
	ret
; 966e2

Function966e2: ; 966e2
	ld hl, ScriptFlags3
	res 1, [hl]
	ret
; 966e8

Function966e8: ; 966e8
	ld hl, ScriptFlags3
	res 0, [hl]
	ret
; 966ee

Function966ee: ; 966ee
	ld hl, ScriptFlags3
	res 4, [hl]
	ret
; 966f4

Function966f4: ; 966f4
	ld hl, ScriptFlags3
	set 2, [hl]
	ret
; 966fa

Function966fa: ; 966fa
	ld hl, ScriptFlags3
	set 1, [hl]
	ret
; 96700

Function96700: ; 96700
	ld hl, ScriptFlags3
	set 0, [hl]
	ret
; 96706

Function96706: ; 96706
	ld hl, ScriptFlags3
	set 4, [hl]
	ret
; 9670c

Function9670c: ; 9670c
	ld hl, ScriptFlags3
	bit 2, [hl]
	ret
; 96712

Function96712: ; 96712
	ld hl, ScriptFlags3
	bit 1, [hl]
	ret
; 96718

Function96718: ; 96718
	ld hl, ScriptFlags3
	bit 0, [hl]
	ret
; 9671e

Function9671e: ; 9671e
	ld hl, ScriptFlags3
	bit 4, [hl]
	ret
; 96724


StartMap: ; 96724
	xor a
	ld [ScriptVar], a
	xor a
	ld [ScriptRunning], a
	ld hl, MapStatus
	ld bc, $3e
	call ByteFill
	callba Function113e5
	call ClearJoypad
	; fallthrough
; 9673e


EnterMap: ; 9673e
	xor a
	ld [$d453], a
	ld [$d454], a
	call Function968d1
	callba Function15363
	call Function966cb

	ld a, [$ff9f]
	cp $f7
	jr nz, .asm_9675a
	call Function966d0
.asm_9675a

	ld a, [$ff9f]
	cp $f3
	jr nz, .asm_96764
	xor a
	ld [PoisonStepCount], a
.asm_96764

	xor a
	ld [$ff9f], a
	ld a, 2 ; HandleMap
	ld [MapStatus], a
	ret
; 9676d


Function9676d: ; 9676d
	ld c, 30
	call DelayFrames
	ret
; 96773


HandleMap: ; 96773
	call ResetOverworldDelay
	call Function967c1
	callba Function97e08
	call MapEvents

; Not immediately entering a connected map will cause problems.
	ld a, [MapStatus]
	cp 2 ; HandleMap
	ret nz

	call Function967d1
	call NextOverworldFrame
	call Function967e1
	call Function967f4
	ret
; 96795


MapEvents: ; 96795
	ld a, [MapEventStatus]
	ld hl, .jumps
	rst JumpTable
	ret

.jumps
	dw .events
	dw .no_events
; 967a1

.events ; 967a1
	call PlayerEvents
	call Function966cb
	callba ScriptEvents
	ret
; 967ae

.no_events ; 967ae
	ret
; 967af


MaxOverworldDelay: ; 967af
	db 2
; 967b0

ResetOverworldDelay: ; 967b0
	ld a, [MaxOverworldDelay]
	ld [OverworldDelay], a
	ret
; 967b7

NextOverworldFrame: ; 967b7
	ld a, [OverworldDelay]
	and a
	ret z
	ld c, a
	call DelayFrames
	ret
; 967c1

Function967c1: ; 967c1
	ld a, [MapEventStatus]
	cp 1 ; no events
	ret z

	call UpdateTime
	call GetJoypad
	call TimeOfDayPals
	ret
; 967d1

Function967d1: ; 967d1
	callba Function576a
	callba Functiond497
	call Function96812
	ret
; 967e1

Function967e1: ; 967e1
	callba Function5920
	callba Functiond4d2
	callba Functionb8098
	ret
; 967f4

Function967f4: ; 967f4
	ld a, [$d150]
	bit 5, a
	jr z, .asm_96806
	bit 6, a
	jr z, .asm_9680c
	bit 4, a
	jr nz, .asm_9680c
	call Function966d0

.asm_96806
	ld a, 0 ; events
	ld [MapEventStatus], a
	ret

.asm_9680c
	ld a, 1 ; no events
	ld [MapEventStatus], a
	ret
; 96812

Function96812: ; 96812
	ld hl, $d150
	bit 6, [hl]
	ret z

	callba Function81ca
	ret
; 9681f


PlayerEvents: ; 9681f

	xor a

	ld a, [ScriptRunning]
	and a
	ret nz

	call Function968e4

	call CheckTrainerBattle3
	jr c, .asm_96848

	call CheckTileEvent
	jr c, .asm_96848

	call Function97c30
	jr c, .asm_96848

	call Function968ec
	jr c, .asm_96848

	call Function9693a
	jr c, .asm_96848

	call OWPlayerInput
	jr c, .asm_96848

	xor a
	ret


.asm_96848
	push af
	callba Function96c56
	pop af

	ld [ScriptRunning], a
	call Function96beb
	ld a, [ScriptRunning]
	cp 4
	jr z, .asm_96865
	cp 9
	jr z, .asm_96865

	xor a
	ld [$c2da], a

.asm_96865
	scf
	ret
; 96867


CheckTrainerBattle3: ; 96867
	nop
	nop
	call CheckTrainerBattle2
	jr nc, .asm_96872

	ld a, 1
	scf
	ret

.asm_96872
	xor a
	ret
; 96874


CheckTileEvent: ; 96874
; Check for warps, tile triggers or wild battles.

	call Function9670c
	jr z, .asm_96886

	callba Function104820
	jr c, .asm_968a6

	call Function2238
	jr c, .asm_968aa

.asm_96886
	call Function96712
	jr z, .asm_96890

	call Function2ad4
	jr c, .asm_968ba

.asm_96890
	call Function96718
	jr z, .asm_96899

	call CountStep
	ret c

.asm_96899
	call Function9671e
	jr z, .asm_968a4

	call Function97cc0
	ret c
	jr .asm_968a4

.asm_968a4
	xor a
	ret

.asm_968a6
	ld a, 4
	scf
	ret

.asm_968aa
	ld a, [StandingTile]
	call CheckPitTile
	jr nz, .asm_968b6
	ld a, 6
	scf
	ret

.asm_968b6
	ld a, 5
	scf
	ret

.asm_968ba
	ld hl, MovementAnimation
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptHeaderBank
	call CallScript
	ret
; 968c7


Function968c7: ; 968c7
	ld hl, $d452
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret z
	scf
	ret
; 968d1

Function968d1: ; 968d1
	ld a, 5
	ld [$d452], a
	ret
; 968d7

Function968d7: ; 968d7
	ret
; 968d8

Function968d8: ; 968d8
	ld a, [$d452]
	cp 2
	ret nc
	ld a, 2
	ld [$d452], a
	ret
; 968e4

Function968e4: ; 968e4
	call Function966d6
	ret z
	call Function2f3e
	ret
; 968ec

Function968ec: ; 968ec
	ld a, [$dc07]
	and a
	jr z, .asm_96938

	ld c, a
	call Function211b
	cp c
	jr nc, .asm_96938

	ld e, a
	ld d, 0
	ld hl, $dc08
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	add hl, de
	add hl, de
	add hl, de

	call GetMapScriptHeaderBank
	call GetFarHalfword
	call GetMapScriptHeaderBank
	call CallScript

	ld hl, ScriptFlags
	res 3, [hl]

	callba Function96c56
	callba ScriptEvents

	ld hl, ScriptFlags
	bit 3, [hl]
	jr z, .asm_96938

	ld hl, $d44f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$d44e]
	call CallScript
	scf
	ret

.asm_96938
	xor a
	ret
; 9693a

Function9693a: ; 9693a
	ld a, [InLinkBattle]
	and a
	jr nz, .asm_96964
	ld hl, StatusFlags2
	bit 2, [hl]
	jr z, .asm_96951
	callba Function114a4
	jr c, .asm_96966
	xor a
	ret

.asm_96951
	callba Function11452
	callba Function114e7
	callba Function90074
	ret c

.asm_96964
	xor a
	ret

.asm_96966
	ld a, $4
	ld hl, $75f8
	call CallScript
	scf
	ret
; 96970

Function96970: ; 96970
	ld a, 8
	scf
	ret
; 96974


OWPlayerInput: ; 96974

	call PlayerMovement
	ret c
	and a
	jr nz, .NoAction

; Can't perform button actions while sliding on ice.
	callba Function80404
	jr c, .NoAction

	call CheckAPressOW
	jr c, .Action

	call CheckMenuOW
	jr c, .Action

.NoAction
	xor a
	ret

.Action
	push af
	callba Function80422
	pop af
	scf
	ret
; 96999


CheckAPressOW: ; 96999
	ld a, [hJoyPressed]
	and A_BUTTON
	ret z
	call TryObjectEvent
	ret c
	call TryReadSign
	ret c
	call Function97c5f
	ret c
	xor a
	ret
; 969ac


PlayTalkObject: ; 969ac
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret
; 969b5


TryObjectEvent: ; 969b5
	callba CheckFacingObject
	jr c, .IsObject
	xor a
	ret

.IsObject
	call PlayTalkObject
	ld a, [hConnectedMapWidth]
	call Function1ae5
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	ld [$ffe0], a

	ld a, [$ffe0]
	call GetMapObject
	ld hl, $0008
	add hl, bc
	ld a, [hl]
	and $f

; Bug: If IsInArray returns nc, data at bc will be executed as code.
	push bc
	ld de, 3
	ld hl, .data_969ee
	call IsInArray
	jr nc, .asm_969ec
	pop bc

	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.asm_969ec
	xor a
	ret

.data_969ee
	dbw 0, .zero
	dbw 1, .one
	dbw 2, .two
	dbw 3, .three
	dbw 4, .four
	dbw 5, .five
	dbw 6, .six
	db $ff
; 96a04

.zero ; 96a04
	ld hl, $000a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptHeaderBank
	call CallScript
;	ld a, -1
	ret
; 96a12

.one ; 96a12
	ld hl, $000a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptHeaderBank
	ld de, EngineBuffer1
	ld bc, 2
	call FarCopyBytes
	ld a, 3
	scf
	ret
; 96a29

.two ; 96a29
	call Function3674
	ld a, 2
	scf
	ret
; 96a30

.three ; 96a30
	xor a
	ret
; 96a32

.four ; 96a32
	xor a
	ret
; 96a34

.five ; 96a34
	xor a
	ret
; 96a36

.six ; 96a36
	xor a
	ret
; 96a38


TryReadSign: ; 96a38
	call CheckFacingSign
	jr c, .IsSign
	xor a
	ret

.IsSign
	ld a, [MartPointer]
	ld hl, .signs
	rst JumpTable
	ret

.signs
	dw .read
	dw .up
	dw .down
	dw .right
	dw .left
	dw .ifset
	dw .ifnotset
	dw .itemifset
	dw .asm_96aa2
; 96a59

.up
	ld b, UP << 2
	jr .checkdir
.down
	ld b, DOWN << 2
	jr .checkdir
.right
	ld b, RIGHT << 2
	jr .checkdir
.left
	ld b, LEFT << 2
	jr .checkdir

.checkdir
	ld a, [PlayerDirection]
	and %1100
	cp b
	jp nz, .dontread

.read
	call PlayTalkObject
	ld hl, $d041
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptHeaderBank
	call CallScript
	scf
	ret

.itemifset
	call CheckSignFlag
	jp nz, .dontread
	call PlayTalkObject
	call GetMapScriptHeaderBank
	ld de, EngineBuffer1
	ld bc, 3
	call FarCopyBytes
	ld a, $4
	ld hl, $7625
	call CallScript
	scf
	ret

.asm_96aa2
	call CheckSignFlag
	jr nz, .dontread
	call GetMapScriptHeaderBank
	ld de, EngineBuffer1
	ld bc, 3
	call FarCopyBytes
	jr .dontread

.ifset
	call CheckSignFlag
	jr z, .dontread
	jr .asm_96ac1

.ifnotset
	call CheckSignFlag
	jr nz, .dontread

.asm_96ac1
	push hl
	call PlayTalkObject
	pop hl
	inc hl
	inc hl
	call GetMapScriptHeaderBank
	call GetFarHalfword
	call GetMapScriptHeaderBank
	call CallScript
	scf
	ret

.dontread
	xor a
	ret
; 96ad8


CheckSignFlag: ; 96ad8
	ld hl, $d041
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	call GetMapScriptHeaderBank
	call GetFarHalfword
	ld e, l
	ld d, h
	ld b, $2
	call EventFlagAction
	ld a, c
	and a
	pop hl
	ret
; 96af0


PlayerMovement: ; 96af0
	callba DoPlayerMovement
	ld a, c
	ld hl, .pointers
	rst JumpTable
	ld a, c
	ret
; 96afd

.pointers
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five
	dw .six
	dw .seven

.zero
.four ; 96b0d
	xor a
	ld c, a
	ret
; 96b10

.seven ; 96b10
	call Function968d7 ; empty
	xor a
	ld c, a
	ret
; 96b16

.one ; 96b16
	ld a, 5
	ld c, a
	scf
	ret
; 96b1b

.two ; 96b1b
	ld a, 9
	ld c, a
	scf
	ret
; 96b20

.three ; 96b20
; force the player to move in some direction
	ld a, $4
	ld hl, $653d
	call CallScript
;	ld a, -1
	ld c, a
	scf
	ret
; 96b2b

.five
.six ; 96b2b
	ld a, -1
	ld c, a
	and a
	ret
; 96b30


CheckMenuOW: ; 96b30
	xor a
	ld [$ffa0], a
	ld [$ffa1], a
	ld a, [hJoyPressed]

	bit 2, a ; SELECT
	jr nz, .Select

	bit 3, a ; START
	jr z, .NoMenu

	ld a, BANK(StartMenuScript)
	ld hl, StartMenuScript
	call CallScript
	scf
	ret

.NoMenu
	xor a
	ret

.Select
	call PlayTalkObject
	ld a, BANK(SelectMenuScript)
	ld hl, SelectMenuScript
	call CallScript
	scf
	ret
; 96b58


StartMenuScript: ; 96b58
	3callasm StartMenu
	2jump StartMenuCallback
; 96b5f

SelectMenuScript: ; 96b5f
	3callasm SelectMenu
	2jump SelectMenuCallback
; 96b66

StartMenuCallback:
SelectMenuCallback: ; 96b66
	copybytetovar $ffa0
	if_equal $80, .Script
	if_equal $ff, .Asm
	end
; 96b72

.Script ; 96b72
	2ptjump $d0e8
; 96b75

.Asm ; 96b75
	2ptcallasm $d0e8
	end
; 96b79


CountStep: ; 96b79
	ld a, [InLinkBattle]
	and a
	jr nz, .asm_96bc9

	callba Function90136
	jr c, .asm_96bcb

	call Function96bd7
	jr c, .asm_96bcb

	ld hl, PoisonStepCount
	inc [hl]
	ld hl, StepCount
	inc [hl]
	jr nz, .asm_96b9c

	callba StepHappiness

.asm_96b9c
	ld a, [StepCount]
	cp $80
	jr nz, .asm_96bab

	callba Function16f3e
	jr nz, .asm_96bcf

.asm_96bab
	callba DaycareStep

	ld hl, PoisonStepCount
	ld a, [hl]
	cp 4
	jr c, .asm_96bc3
	ld [hl], 0

	callba Function505da
	jr c, .asm_96bcb

.asm_96bc3
	callba Function97db3

.asm_96bc9
	xor a
	ret

.asm_96bcb
	ld a, -1
	scf
	ret

.asm_96bcf
	ld a, 8
	scf
	ret
; 96bd3


Function96bd3: ; 96bd3
	ld a, $7
	scf
	ret
; 96bd7

Function96bd7: ; 96bd7
	ld a, [$dca1]
	and a
	ret z
	dec a
	ld [$dca1], a
	ret nz
	ld a, $4
	ld hl, $7619
	call CallScript
	scf
	ret
; 96beb

Function96beb: ; 96beb
	ld a, [ScriptRunning]
	and a
	ret z
	cp $ff
	ret z
	cp $a
	ret nc

	ld c, a
	ld b, 0
	ld hl, ScriptPointers96c0c
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [ScriptBank], a
	ld a, [hli]
	ld [ScriptPos], a
	ld a, [hl]
	ld [ScriptPos + 1], a
	ret
; 96c0c

ScriptPointers96c0c: ; 96c0c
	dbw BANK(UnknownScript_0x96c2d), UnknownScript_0x96c2d
	dbw BANK(UnknownScript_0xbe675), UnknownScript_0xbe675
	dbw BANK(UnknownScript_0xbe66a), UnknownScript_0xbe66a
	dbw BANK(UnknownScript_0x122ce), UnknownScript_0x122ce
	dbw BANK(UnknownScript_0x96c4d), UnknownScript_0x96c4d
	dbw BANK(UnknownScript_0x96c34), UnknownScript_0x96c34
	dbw BANK(FallIntoMapScript), FallIntoMapScript
	dbw BANK(UnknownScript_0x124c8), UnknownScript_0x124c8
	dbw BANK(UnknownScript_0x96c2f), UnknownScript_0x96c2f
	dbw BANK(UnknownScript_0x96c4f), UnknownScript_0x96c4f
	dbw BANK(UnknownScript_0x96c2d), UnknownScript_0x96c2d
; 96c2d

UnknownScript_0x96c2d: ; 96c2d
	end
; 96c2e

UnknownScript_0x96c2e: ; 96c2e
	end
; 96c2f

UnknownScript_0x96c2f: ; 96c2f
	3callasm Function16f5e
	end
; 96c34

UnknownScript_0x96c34: ; 96c34
	warpsound
	newloadmap $f5
	end
; 96c38

FallIntoMapScript: ; 96c38
	newloadmap $f6
	playsound SFX_KINESIS
	applymovement $0, MovementData_0x96c48
	playsound SFX_STRENGTH
	2call UnknownScript_0x96c4a
	end
; 96c48

MovementData_0x96c48: ; 96c48
	skyfall
	step_end
; 96c4a

UnknownScript_0x96c4a: ; 96c4a
	earthquake 16
	end
; 96c4d

UnknownScript_0x96c4d: ; 96c4d
	reloadandreturn $f7
; 96c4f

UnknownScript_0x96c4f: ; 96c4f
	deactivatefacing $3
	3callasm Function96706
	end
; 96c56

