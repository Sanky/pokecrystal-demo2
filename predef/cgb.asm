; Replaces the functionality of sgb.asm to work with CGB hardware.

CheckCGB: ; 8d55
	ld a, [hCGB]
	and a
	ret
; 8d59

Function8d59: ; 8d59
	ld a, b
	cp $ff
	jr nz, .asm_8d61
	ld a, [SGBPredef]

.asm_8d61
	cp $fc
	jp z, Function96f3
	call Function9673
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Table8d7a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, Function8d79
	push de
	jp [hl]
; 8d79

Function8d79: ; 8d79
	ret
; 8d7a

Table8d7a: ; 8d7a
	dw Function8db8
	dw Function8ddb
	dw Function8eb9
	dw Function8edb
	dw Function8f70
	dw Function906e
	dw Function90f8
	dw Function9122
	dw Function91ad
	dw Function91c8
	dw Function91d1
	dw Function91e4
	dw Function9228
	dw Function9251
	dw Function9373
	dw Function93a6
	dw Function93ba
	dw Function9195
	dw Function9499
	dw Function94d0
	dw Function93d3
	dw Function9289
	dw Function903e
	dw Function8fca
	dw Function925e
	dw Function94fa
	dw Function9529
	dw Function9555
	dw Function9578
	dw Function9591
	dw Function9542
; 8db8

Function8db8: ; 8db8
	ld hl, $5c67
	ld de, $d000
	ld c, $4
	call Function9615
	ld hl, $5c67
	ld de, $d020
	ld c, $4
	call Function9615
	ld hl, $5c67
	ld de, MartPointer
	ld c, $2
	call Function9615
	jr Function8e23

Function8ddb: ; 8ddb
	ld de, $d000
	call Function9729
	push hl
	call Function9643
	call Function973a
	push hl
	call Function9643
	ld a, [EnemyHPPal]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, $68be
	add hl, bc
	call Function9643
	ld a, [PlayerHPPal]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, $68be
	add hl, bc
	call Function9643
	ld hl, $68ca
	call Function9643
	ld de, MartPointer
	pop hl
	call Function9643
	pop hl
	call Function9643
	ld a, $1
	ld [SGBPredef], a
	call Function96a4

Function8e23: ; 8e23
	call Function8e85
	ld hl, AttrMap
	ld bc, $0168
	ld a, $2
	call ByteFill
	ld hl, $ce29
	ld bc, $080a
	ld a, $0
	call Function9663
	ld hl, $cde3
	ld bc, $070a
	ld a, $1
	call Function9663
	ld hl, AttrMap
	ld bc, $040a
	ld a, $2
	call Function9663
	ld hl, $ce6f
	ld bc, $050a
	ld a, $3
	call Function9663
	ld hl, $cebf
	ld bc, $0109
	ld a, $4
	call Function9663
	ld hl, $cec9
	ld bc, $0078
	ld a, $7
	call ByteFill
	ld hl, $579c
	ld de, $d050
	ld bc, $0030
	ld a, $5
	call FarCopyWRAM
	call Function96b3
	ret
; 8e85


Function8e85: ; 8e85
	callba Function100dc0

Function8e8b: ; 8e8b
	ld hl, $7311
	jr nc, .asm_8e93
	ld hl, $7309

.asm_8e93
	ld de, $d038
	ld bc, $0008
	ld a, $5
	call FarCopyWRAM
	ret
; 8e9f

Function8e9f: ; 8e9f
	callba Function100dc0
	ld hl, $7311
	jr nc, .asm_8ead
	ld hl, $7309

.asm_8ead
	ld de, $d000
	ld bc, $0008
	ld a, $5
	call FarCopyWRAM
	ret
; 8eb9

Function8eb9: ; 8eb9
	ld a, [PlayerGender]
	bit 0, a
	jr z, .asm_8ec5
	ld hl, $7759
	jr .asm_8ec8

.asm_8ec5
	ld hl, $7729

.asm_8ec8
	ld de, $d000
	ld bc, $0030
	ld a, $5
	call FarCopyWRAM
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 8edb

Function8edb: ; 8edb
	ld de, $d000
	ld a, [$cda1]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, $68be
	add hl, bc
	call Function9643
	ld a, [CurPartySpecies]
	ld bc, TempMonDVs
	call Function974b
	call Function9643
	ld hl, $68ca
	call Function9643
	ld hl, Palette8f52
	ld de, $d018
	ld bc, $0018
	ld a, $5
	call FarCopyWRAM
	call Function9699
	ld hl, AttrMap
	ld bc, $0814
	ld a, $1
	call Function9663
	ld hl, $cf23
	ld bc, $000a
	ld a, $2
	call ByteFill
	ld hl, $ce4a
	ld bc, $0202
	ld a, $3
	call Function9663
	ld hl, $ce4c
	ld bc, $0202
	ld a, $4
	call Function9663
	ld hl, $ce4e
	ld bc, $0202
	ld a, $5
	call Function9663
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 8f52

Palette8f52: ; 8f52
	RGB 31, 31, 31
	RGB 31, 19, 31
	RGB 31, 15, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 31, 14
	RGB 17, 31, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 17, 31, 31
	RGB 17, 31, 31
	RGB 00, 00, 00
; 8f6a

INCBIN "baserom.gbc", $8f6a, $8f70 - $8f6a

Function8f70: ; 8f70
	ld de, Unkn1Pals
	ld a, $1d
	call Function9625
	call Function9630
	ld a, [CurPartySpecies]
	cp $ff
	jr nz, .asm_8f8a
	ld hl, Palette8fba
	call Function9630
	jr .asm_8f90

.asm_8f8a
	call Function9775
	call Function9643

.asm_8f90
	call Function9699
	ld hl, $cdee
	ld bc, $0707
	ld a, $1
	call Function9663
	call Function971a
	ld hl, Palette8fc2
	ld de, $d078
	ld bc, $0008
	ld a, $5
	call FarCopyWRAM
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 8fba

Palette8fba: ; 8fba
	RGB 11, 23, 00
	RGB 07, 17, 00
	RGB 06, 16, 03
	RGB 05, 12, 01

Palette8fc2: ; 8fc2
	RGB 00, 00, 00
	RGB 11, 23, 00
	RGB 07, 17, 00
	RGB 00, 00, 00
; 8fca

Function8fca: ; 8fca
	ld de, Unkn1Pals
	ld a, $1d
	call Function9625
	call Function9630
	ld a, [CurPartySpecies]
	cp $ff
	jr nz, .asm_8fe4
	ld hl, Palette9036
	call Function9630
	jr .asm_8fed

.asm_8fe4
	ld bc, TempMonDVs
	call Function974b
	call Function9643

.asm_8fed
	call Function9699
	ld hl, $ce2a
	ld bc, $0707
	ld a, $1
	call Function9663
	call Function971a
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 9009

INCBIN "baserom.gbc", $9009, $9036 - $9009

Palette9036: ; 9036
	RGB 31, 15, 00
	RGB 23, 12, 00
	RGB 15, 07, 00
	RGB 00, 00, 00
; 903e

Function903e: ; 903e
	ld de, Unkn1Pals
	ld a, $1d
	call Function9625
	call Function9630
	ld a, [CurPartySpecies]
	call Function9775
	call Function9643
	call Function9699
	ld hl, $ce44
	ld bc, $0707
	ld a, $1
	call Function9663
	call Function971a
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 906e

Function906e: ; 906e
	ld hl, Paletteb7a9
	ld de, Unkn1Pals
	ld bc, $0080
	ld a, $5
	call FarCopyWRAM
	call Function9699
	ld hl, $ce01
	ld bc, $0a03
	ld a, $2
	call Function9663
	ld hl, $ce12
	ld bc, $0a03
	ld a, $2
	call Function9663
	ld hl, $ce29
	ld bc, $0603
	ld a, $3
	call Function9663
	ld hl, $ce3a
	ld bc, $0603
	ld a, $3
	call Function9663
	ld hl, $ce51
	ld bc, $0203
	ld a, $4
	call Function9663
	ld hl, $ce62
	ld bc, $0203
	ld a, $4
	call Function9663
	ld hl, $ce05
	ld bc, $020c
	ld a, $1
	call Function9663
	ld hl, $ce04
	ld bc, $0a01
	ld a, $1
	call Function9663
	ld hl, $ce11
	ld bc, $0a01
	ld a, $1
	call Function9663
	ld hl, $cec9
	ld bc, $0078
	ld a, $7
	call ByteFill
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 90f8

Function90f8: ; 90f8
	ld hl, $5ca7
	call Function9610
	call Function9699
	ld de, Unkn2Pals
	ld a, $3c
	call Function9625
	call Function9630
	ld hl, $ce51
	ld bc, $0c14
	ld a, $1
	call Function9663
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 9122

Function9122: ; 9122
	ld b, $0
	ld hl, $512d
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 912d

INCBIN "baserom.gbc", $912d, $9195 - $912d

Function9195: ; 9195
	ld hl, $7789
	ld de, Unkn1Pals
	ld bc, $0028
	ld a, $5
	call FarCopyWRAM
	call Function96a4
	call Function9699
	call Function96b3
	ret
; 91ad

Function91ad: ; 91ad
	ld hl, $7641
	ld de, Unkn1Pals
	ld bc, $0080
	ld a, $5
	call FarCopyWRAM
	ld hl, $5cb7
	call Function9610
	call Function9699
	call Function96b3
	ret
; 91c8

Function91c8: ; 91c8
	call Functionb1de
	ld a, $9
	ld [SGBPredef], a
	ret
; 91d1

Function91d1: ; 91d1
	ld hl, $5c57
	call Function9610
	call Function8e9f
	call Function8e85
	call Function971a
	call Function96b3
	ret
; 91e4

Function91e4: ; 91e4
	ld de, Unkn1Pals
	ld a, c
	and a
	jr z, .asm_91f5
	ld a, $1a
	call Function9625
	call Function9630
	jr .asm_921a

.asm_91f5
	ld hl, PartyMon1DVs
	ld bc, $0030
	ld a, [CurPartyMon]
	call AddNTimes
	ld c, l
	ld b, h
	ld a, [PlayerHPPal]
	call Function974b
	call Function9643
	ld hl, $579c
	ld de, $d050
	ld bc, $0030
	ld a, $5
	call FarCopyWRAM

.asm_921a
	call Function9699
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 9228

Function9228: ; 9228
	ld hl, $76f1
	ld de, Unkn1Pals
	ld bc, $0028
	ld a, $5
	call FarCopyWRAM
	ld hl, $7719
	ld de, Unkn2Pals
	ld bc, $0010
	ld a, $5
	call FarCopyWRAM
	ld a, $8
	ld [SGBPredef], a
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 9251

Function9251: ; 9251
	ld hl, $5cb7
	call Function9610
	call Function9699
	call Function96b3
	ret
; 925e

Function925e: ; 925e
	ld hl, $5bc7
	call Function9610
	ld de, Unkn2Pals
	ld a, $4c
	call Function9625
	call Function9630
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Unkn2Pals
	ld a, $1f
	ld [hli], a
	ld a, $0
	ld [hl], a
	pop af
	ld [rSVBK], a
	call Function9699
	call Function96b3
	ret
; 9289

Function9289: ; 9289
	ld de, Unkn1Pals
	xor a
	call Function976b
	call Function9643
	ld a, $1
	call Function976b
	call Function9643
	ld a, $3
	call Function976b
	call Function9643
	ld a, $2
	call Function976b
	call Function9643
	ld a, $4
	call Function976b
	call Function9643
	ld a, $7
	call Function976b
	call Function9643
	ld a, $6
	call Function976b
	call Function9643
	ld a, $5
	call Function976b
	call Function9643
	ld a, $24
	call Function9625
	call Function9630
	ld hl, AttrMap
	ld bc, $0168
	ld a, [PlayerGender]
	and a
	ld a, $1
	jr z, .asm_92e3
	ld a, $0

.asm_92e3
	call ByteFill
	ld hl, $cdfb
	ld bc, $0705
	ld a, [PlayerGender]
	and a
	ld a, $0
	jr z, .asm_92f6
	ld a, $1

.asm_92f6
	call Function9663
	ld hl, $cdff
	ld [hl], $1
	ld hl, $ceb7
	ld bc, $0204
	ld a, $1
	call Function9663
	ld hl, $cebb
	ld bc, $0204
	ld a, $2
	call Function9663
	ld hl, $cebf
	ld bc, $0204
	ld a, $3
	call Function9663
	ld hl, $cec3
	ld bc, $0204
	ld a, $4
	call Function9663
	ld hl, $cef3
	ld bc, $0204
	ld a, $5
	call Function9663
	ld hl, $cef7
	ld bc, $0204
	ld a, $6
	call Function9663
	ld hl, $cefb
	ld bc, $0204
	ld a, $7
	call Function9663
	ld a, [PlayerGender]
	and a
	push af
	jr z, .asm_935d
	ld hl, $ceff
	ld bc, $0204
	ld a, $1
	call Function9663

.asm_935d
	pop af
	ld c, $0
	jr nz, .asm_9363
	inc c

.asm_9363
	ld a, c
	ld hl, $cdff
	ld [hl], a
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 9373

Function9373: ; 9373
	ld de, Unkn1Pals
	ld a, $10
	call Function9625
	call Function9630
	ld a, [PlayerHPPal]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, $68be
	add hl, bc
	call Function9643
	call Function9699
	ld hl, $cdf8
	ld bc, $0209
	ld a, $1
	call Function9663
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 93a6

Function93a6: ; 93a6
	ld hl, $5c47
	call Function9610
	call Function9699
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 93ba

Function93ba: ; 93ba
	ld de, Unkn1Pals
	ld a, $1d
	call Function9625
	call Function9630
	call Function9699
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 93d3

Function93d3: ; 93d3
	ld a, [BattleType]
	cp $3
	jr z, .asm_93e6
	ld a, [PlayerGender]
	bit 0, a
	jr z, .asm_93e6
	ld hl, $5469
	jr .asm_93e9

.asm_93e6
	ld hl, $5439

.asm_93e9
	ld de, Unkn1Pals
	ld bc, $0040
	ld a, $5
	call FarCopyWRAM
	call Function9699
	ld hl, AttrMap
	ld bc, $010a
	ld a, $1
	call Function9663
	ld hl, $cde3
	ld bc, $010a
	ld a, $2
	call Function9663
	ld hl, $ce08
	ld bc, $0901
	ld a, $3
	call Function9663
	ld hl, $ce65
	ld bc, $0305
	ld a, $4
	call Function9663
	ld hl, $ce15
	ld bc, $0305
	ld a, $5
	call Function9663
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 9439

INCBIN "baserom.gbc", $9439, $9499 - $9439

Function9499: ; 9499
	call Function91c8
	ld de, $0014
	ld hl, AttrMap
	ld a, [$cf82]
.asm_94a5
	and a
	jr z, .asm_94ac
	dec a
	add hl, de
	jr .asm_94a5

.asm_94ac
	ld a, [$cf83]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [$cf82]
	ld b, a
	ld a, [$cf84]
	inc a
	sub b
	ld b, a
	ld a, [$cf83]
	ld c, a
	ld a, [$cf85]
	sub c
	inc a
	ld c, a
	ld a, $0
	call Function9663
	call Function96b3
	ret
; 94d0

Function94d0: ; 94d0
	ld hl, $5ba7
	call Function9610
	call Function9699
	ld hl, $ce29
	ld bc, $0a14
	ld a, $2
	call Function9663
	ld hl, $ce51
	ld bc, $0614
	ld a, $1
	call Function9663
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 94fa

Function94fa: ; 94fa
	ld de, Unkn1Pals
	ld a, $4e
	call Function9625
	call Function9630
	ld hl, $5521
	ld de, Unkn2Pals
	call Function9630
	ld hl, $5521
	ld de, $d048
	call Function9630
	call Function9699
	call Function96b3
	call Function96a4
	ret
; 9521

INCBIN "baserom.gbc", $9521, $9529 - $9521

Function9529: ; 9529
	ld de, Unkn1Pals
	ld a, [CurPartySpecies]
	ld bc, TempMonDVs
	call Function974b
	call Function9643
	call Function9699
	call Function96b3
	call Function96a4
	ret
; 9542

Function9542: ; 9542
	ld de, Unkn1Pals
	ld a, [CurPartySpecies]
	call Function9775
	call Function9643
	call Function9699
	call Function96b3
	ret
; 9555

Function9555: ; 9555
	ld hl, $5cc7
	call Function9610
	ld hl, $7681
	ld de, Unkn2Pals
	ld bc, $0008
	ld a, $5
	call FarCopyWRAM
	ld de, $d078
	ld a, $1c
	call Function9625
	call Function9630
	call Function9699
	ret
; 9578

Function9578: ; 9578
	ld de, Unkn1Pals
	ld a, [CurPartySpecies]
	ld bc, TempMonDVs
	call Function9764
	call Function9643
	call Function9699
	call Function96b3
	call Function96a4
	ret
; 9591

Function9591: ; 9591
	ld hl, Palette95e0
	ld de, Unkn1Pals
	ld bc, $0010
	ld a, $5
	call FarCopyWRAM
	call Function96a4
	call Function9699
	ld hl, $ce68
	ld bc, $080e
	ld a, $1
	call Function9663
	ld hl, $ce3e
	ld bc, $0112
	ld a, $1
	call Function9663
	ld hl, $cf1a
	ld bc, $0112
	ld a, $1
	call Function9663
	ld hl, AttrMap
	ld bc, $1102
	ld a, $1
	call Function9663
	ld hl, $ce4f
	ld bc, $0c01
	ld a, $1
	call Function9663
	call Function96b3
	ret
; 95e0

Palette95e0: ; 95e0
	RGB 31, 31, 31
	RGB 16, 31, 14
	RGB 05, 14, 21
	RGB 05, 13, 10

	RGB 31, 31, 31
	RGB 11, 21, 25
	RGB 05, 14, 21
	RGB 00, 03, 19
; 95f0

