; Objects used in battle animations.


; known jump sources: cc437 (33:4437)
Functioncc9a1: ; cc9a1 (33:49a1)
	ld hl, $d30a
	ld e, $a
.asm_cc9a6
	ld a, [hl]
	and a
	jr z, .asm_cc9b3
	ld bc, $18
	add hl, bc
	dec e
	jr nz, .asm_cc9a6
	scf
	ret
.asm_cc9b3
	ld c, l
	ld b, h
	ld hl, $d40e
	inc [hl]
	call Functioncc9c4
	ret


Functioncc9bd: ; cc9bd
	ld hl, $0000
	add hl, bc
	ld [hl], $0
	ret
; cc9c4


; known jump sources: cc9b9 (33:49b9)
Functioncc9c4: ; cc9c4 (33:49c4)
	ld a, [$d419]
	ld e, a
	ld d, $0
	ld hl, $4b56
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld e, l
	ld d, h
	ld hl, $0
	add hl, bc
	ld a, [$d40e]
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	call Functionccb31
	ld [hli], a
	ld a, [$d41a]
	ld [hli], a
	ld a, [$d41b]
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [$d41c]
	ld [hli], a
	xor a
	ld [hli], a
	dec a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret


Functioncca09: ; cca09
	call Functionccaaa
	call Functionce7d1
	cp EGG
	jp z, .asm_ccaa5
	cp NUM_POKEMON + 1
	jp z, .asm_ccaa2
	push af
	ld hl, $d419
	ld a, [$d420]
	xor [hl]
	and $e0
	ld [hl], a
	pop af
	push bc
	call Functionce83c
	ld a, [$d41b]
	add [hl]
	ld [$d41b], a
	inc hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$d418]
	ld e, a
	ld d, $c4
.asm_cca3c
	ld a, [$d41d]
	ld b, a
	ld a, [$d41f]
	add b
	ld b, a
	push hl
	ld a, [hl]
	ld hl, $d419
	bit 6, [hl]
	jr z, .asm_cca53
	add $8
	xor $ff
	inc a

.asm_cca53
	pop hl
	add b
	ld [de], a
	inc hl
	inc de
	ld a, [$d41c]
	ld b, a
	ld a, [$d41e]
	add b
	ld b, a
	push hl
	ld a, [hl]
	ld hl, $d419
	bit 5, [hl]
	jr z, .asm_cca6f
	add $8
	xor $ff
	inc a

.asm_cca6f
	pop hl
	add b
	ld [de], a
	inc hl
	inc de
	ld a, [$d41b]
	add $31
	add [hl]
	ld [de], a
	inc hl
	inc de
	ld a, [$d419]
	ld b, a
	ld a, [hl]
	xor b
	and $e0
	ld b, a
	ld a, [hl]
	and $10
	or b
	ld b, a
	ld a, [OTPartyMon6Nickname]
	and $f
	or b
	ld [de], a
	inc hl
	inc de
	ld a, e
	ld [$d418], a
	cp $a0
	jr nc, .asm_ccaa7
	dec c
	jr nz, .asm_cca3c
	pop bc
	jr .asm_ccaa5

.asm_ccaa2
	call Functioncc9bd

.asm_ccaa5
	and a
	ret

.asm_ccaa7
	pop bc
	scf
	ret
; ccaaa

Functionccaaa: ; ccaaa
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	and $80
	ld [$d419], a
	xor a
	ld [$d420], a
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	ld [OTPartyMon6Nickname], a
	ld hl, $0002
	add hl, bc
	ld a, [hl]
	ld [$d41a], a
	ld hl, $0006
	add hl, bc
	ld a, [hli]
	ld [$d41b], a
	ld a, [hli]
	ld [$d41c], a
	ld a, [hli]
	ld [$d41d], a
	ld a, [hli]
	ld [$d41e], a
	ld a, [hli]
	ld [$d41f], a
	ld a, [hBattleTurn]
	and a
	ret z
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	ld [$d419], a
	bit 0, [hl]
	ret z
	ld hl, $0007
	add hl, bc
	ld a, [hli]
	ld d, a
	ld a, $b4
	sub d
	ld [$d41c], a
	ld a, [hli]
	ld d, a
	ld a, [$d41a]
	cp $ff
	jr nz, .asm_ccb09
	ld a, $28
	add d
	jr .asm_ccb26

.asm_ccb09
	sub d
	push af
	ld a, [FXAnimIDHi]
	or a
	jr nz, .asm_ccb25
	ld a, [FXAnimIDLo]
	cp $86
	jr z, .asm_ccb20
	cp $87
	jr z, .asm_ccb20
	cp $d0
	jr nz, .asm_ccb25

.asm_ccb20
	pop af
	sub $8
	jr .asm_ccb26

.asm_ccb25
	pop af

.asm_ccb26
	ld [$d41d], a
	ld a, [hli]
	xor $ff
	inc a
	ld [$d41e], a
	ret
; ccb31


; known jump sources: cc9ed (33:49ed)
Functionccb31: ; ccb31 (33:4b31)
	push hl
	push bc
	ld hl, $d300
	ld b, a
	ld c, $5
.asm_ccb39
	ld a, [hli]
	cp b
	jr z, .asm_ccb44
	inc hl
	dec c
	jr nz, .asm_ccb39
	xor a
	jr .asm_ccb45
.asm_ccb44
	ld a, [hl]
.asm_ccb45
	pop bc
	pop hl
	ret


Functionccb48: ; ccb48
	callab Functionc8000
	ret
; ccb4f


; known jump sources: cc453 (33:4453)
Functionccb4f: ; ccb4f (33:4b4f)
	callab Functionc801a
	ret
; ccb56 (33:4b56)

INCBIN "baserom.gbc",$ccb56,$ccfbe - $ccb56


Functionccfbe: ; ccfbe
	ld hl, $0004
	add hl, bc
	ld e, [hl]
	ld d, $0
	ld hl, $4fce
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; ccfce


; no known jump sources
Jumptable_ccfce: ; ccfce (33:4fce)
	dw Functioncd06e
	dw Functioncd12a
	dw Functioncd146
	dw Functioncd0e3
	dw Functioncd0a6
	dw Functioncd081
	dw Functioncd079
	dw Functioncd2be
	dw Functioncd306
	dw Functioncd3ae
	dw Functioncd3f2
	dw Functioncd478
	dw Functioncd5e9
	dw Functioncd66a
	dw Functioncd6e3
	dw Functioncd71a
	dw Functioncd284
	dw Functioncd777
	dw Functioncd15c
	dw Functioncd212
	dw Functioncd7a4
	dw Functioncd80c
	dw Functioncd824
	dw Functioncd89a
	dw Functioncd900
	dw Functioncd954
	dw Functioncdafa
	dw Functioncdb06
	dw Functioncda0a
	dw Functioncdb80
	dw Functioncdca6
	dw Functioncda31
	dw Functioncda4d
	dw Functioncdcc3
	dw Functioncdd2a
	dw Functioncdd90
	dw Functioncddf9
	dw Functioncde28
	dw Functioncde54
	dw Functioncde6b
	dw Functioncde89
	dw Functioncdedd
	dw Functioncdf59
	dw Functionce063
	dw Functionce0c5
	dw Functioncdf1b
	dw Functionce10e
	dw Functionce15c
	dw Functionce1e7
	dw Functionce226
	dw Functionce255
	dw Functionce2cc
	dw Functioncdf8c
	dw Functionce00b
	dw Functionce2fd
	dw Functionce35f
	dw Functionce389
	dw Functionce3b4
	dw Functionce3d2
	dw Functionce3ff
	dw Functioncdfcb
	dw Functionce416
	dw Functionce43a
	dw Functioncdad6
	dw Functionce49c
	dw Functionce4dc
	dw Functionce1b0
	dw Functionce508
	dw Functionce532
	dw Functionce55b
	dw Functionce593
	dw Functionce5b4
	dw Functionce5dc
	dw Functionce5ee
	dw Functionce62f
	dw Functionce688
	dw Functionce6b3
	dw Functionce6d2
	dw Functioncd58a
	dw Functionce6bf


; no known jump sources
Functioncd06e: ; cd06e (33:506e)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd071: ; cd071 (33:5071)
	dw Functioncd078
	dw Functioncd075


; no known jump sources
Functioncd075: ; cd075 (33:5075)
	call Functioncc9bd

; no known jump sources
Functioncd078: ; cd078 (33:5078)
	ret

; no known jump sources
Functioncd079: ; cd079 (33:5079)
	call Functioncd081
	ret c
	call Functioncc9bd
	ret

; known jump sources: cd079 (33:5079), cd17e (33:517e), cd22b (33:522b)
Functioncd081: ; cd081 (33:5081)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $88
	ret nc
	add $2
	ld [hl], a
	ld hl, $8
	add hl, bc
	dec [hl]
	ld hl, $f
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld hl, $b
	add hl, bc
	ld d, [hl]
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	scf
	ret

; no known jump sources
Functioncd0a6: ; cd0a6 (33:50a6)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $88
	jr c, .asm_cd0b3
	call Functioncc9bd
	ret
.asm_cd0b3
	add $2
	ld [hl], a
	ld hl, $8
	add hl, bc
	dec [hl]
	ld hl, $f
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ld d, $10
	push af
	push de
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	sra a
	sra a
	sra a
	sra a
	ld [hl], a
	ret

; known jump sources: cdafa (33:5afa)
Functioncd0e3: ; cd0e3 (33:50e3)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd0e6: ; cd0e6 (33:50e6)
	dw Functioncd0ea
	dw Functioncd106


; no known jump sources
Functioncd0ea: ; cd0ea (33:50ea)
	call Functionce72c
	ld hl, $b
	add hl, bc
	bit 7, [hl]
	ld a, $0
	jr z, .asm_cd0f9
	ld a, $20
.asm_cd0f9
	ld hl, $f
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a

; no known jump sources
Functioncd106: ; cd106 (33:5106)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld hl, $b
	add hl, bc
	ld d, [hl]
	push af
	push de
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	inc [hl]
	ret

; no known jump sources
Functioncd12a: ; cd12a (33:512a)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd12d: ; cd12d (33:512d)
	dw Functioncd135
	dw Functioncd131


; no known jump sources
Functioncd131: ; cd131 (33:5131)
	call Functioncc9bd
	ret

; no known jump sources
Functioncd135: ; cd135 (33:5135)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $84
	ret nc
	ld hl, $b
	add hl, bc
	ld a, [hl]
	call Functionce70a
	ret

; no known jump sources
Functioncd146: ; cd146 (33:5146)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $84
	jr nc, .asm_cd158
	ld hl, $b
	add hl, bc
	ld a, [hl]
	call Functionce70a
	ret
.asm_cd158
	call Functioncc9bd
	ret

; no known jump sources
Functioncd15c: ; cd15c (33:515c)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd15f: ; cd15f (33:515f)
	dw Functioncd177
	dw Functioncd17e
	dw Functioncd1dc
	dw Functioncd196
	dw Functioncd1a7
	dw Functioncd1dc
	dw Functioncd1d2
	dw Functioncd1dd
	dw Functioncd1ee
	dw Functioncd1dc
	dw Functioncd1ee
	dw Functioncd20e


; no known jump sources
Functioncd177: ; cd177 (33:5177)
	call Functioncd249
	call Functionce72c
	ret

; no known jump sources
Functioncd17e: ; cd17e (33:517e)
	call Functioncd081
	ret c
	ld hl, $a
	add hl, bc
	ld a, [hl]
	ld hl, $8
	add hl, bc
	add [hl]
	ld [hl], a
	ld a, $b
	call Functionce7bf
	call Functionce72c
	ret

; no known jump sources
Functioncd196: ; cd196 (33:5196)
	call Functionce72c
	ld a, $9
	call Functionce7bf
	ld hl, $f
	add hl, bc
	ld [hl], $0
	inc hl
	ld [hl], $10

; no known jump sources
Functioncd1a7: ; cd1a7 (33:51a7)
	ld hl, $f
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and $1f
	ret nz
	ld [hl], a
	ld hl, $10
	add hl, bc
	ld a, [hl]
	sub $4
	ld [hl], a
	ret nz
	ld a, $c
	call Functionce7bf
	call Functionce72c
	ret

; no known jump sources
Functioncd1d2: ; cd1d2 (33:51d2)
	ld a, $d
	call Functionce7bf
	ld hl, $e
	add hl, bc
	dec [hl]

; no known jump sources
Functioncd1dc: ; cd1dc (33:51dc)
	ret

; no known jump sources
Functioncd1dd: ; cd1dd (33:51dd)
	call Functioncd249
	ld a, $a
	call Functionce7bf
	call Functionce72c
	ld hl, $10
	add hl, bc
	ld [hl], $20

; no known jump sources
Functioncd1ee: ; cd1ee (33:51ee)
	ld hl, $f
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and $1f
	jr z, Functioncd20e
	and $f
	ret nz
	call Functionce72c
	ret

; known jump sources: cd205 (33:5205)
Functioncd20e: ; cd20e (33:520e)
	call Functioncc9bd
	ret

; no known jump sources
Functioncd212: ; cd212 (33:5212)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd215: ; cd215 (33:5215)
	dw Functioncd21b
	dw Functioncd222
	dw Functioncd232


; no known jump sources
Functioncd21b: ; cd21b (33:521b)
	call Functioncd249
	call Functionce72c
	ret

; no known jump sources
Functioncd222: ; cd222 (33:5222)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $70
	jr nc, .asm_cd22f
	call Functioncd081
	ret
.asm_cd22f
	call Functionce72c

; no known jump sources
Functioncd232: ; cd232 (33:5232)
	ld hl, $8
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .asm_cd245
	add $4
	ld [hl], a
	ld hl, $7
	add hl, bc
	dec [hl]
	dec [hl]
	ret
.asm_cd245
	call Functioncc9bd
	ret

; known jump sources: cd177 (33:5177), cd1dd (33:51dd), cd21b (33:521b)
Functioncd249: ; cd249 (33:5249)
	ld hl, $526c
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $1
	ld [rSVBK], a ; $ff00+$70
	ld a, [CurItem] ; $d106
	ld e, a
	pop af
	ld [rSVBK], a ; $ff00+$70
.asm_cd25a
	ld a, [hli]
	cp $ff
	jr z, .asm_cd265
	cp e
	jr z, .asm_cd265
	inc hl
	jr .asm_cd25a
.asm_cd265
	ld a, [hl]
	ld hl, $5
	add hl, bc
	ld [hl], a
	ret
; cd26c (33:526c)

INCBIN "baserom.gbc",$cd26c,$cd284 - $cd26c

; no known jump sources
Functioncd284: ; cd284 (33:5284)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd287: ; cd287 (33:5287)
	dw Functioncd291
	dw Functioncd2a0
	dw Functioncd2b1
	dw Functioncd2b5
	dw Functioncd2bd


; no known jump sources
Functioncd291: ; cd291 (33:5291)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	ld hl, $e
	add hl, bc
	ld [hl], a
	ret

; no known jump sources
Functioncd2a0: ; cd2a0 (33:52a0)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $88
	ret nc
	ld hl, $b
	add hl, bc
	ld a, [hl]
	call Functionce70a
	ret

; no known jump sources
Functioncd2b1: ; cd2b1 (33:52b1)
	call Functioncc9bd
	ret

; no known jump sources
Functioncd2b5: ; cd2b5 (33:52b5)
	call Functionce72c
	ld a, $f
	call Functionce7bf

; no known jump sources
Functioncd2bd: ; cd2bd (33:52bd)
	ret

; no known jump sources
Functioncd2be: ; cd2be (33:52be)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd2c1: ; cd2c1 (33:52c1)
	dw Functioncd2c5
	dw Functioncd2d1


; no known jump sources
Functioncd2c5: ; cd2c5 (33:52c5)
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $30
	inc hl
	ld [hl], $48

; no known jump sources
Functioncd2d1: ; cd2d1 (33:52d1)
	ld hl, $f
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, $f
	add hl, bc
	ld [hl], $20
	ld hl, $10
	add hl, bc
	ld a, [hl]
	ld hl, $b
	add hl, bc
	sub [hl]
	jr z, .asm_cd302
	jr c, .asm_cd302
	ld hl, $10
	add hl, bc
	ld [hl], a
	ret
.asm_cd302
	call Functioncc9bd
	ret

; no known jump sources
Functioncd306: ; cd306 (33:5306)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd309: ; cd309 (33:5309)
	dw Functioncd311
	dw Functioncd321
	dw Functioncd32a
	dw Functioncd37d


; no known jump sources
Functioncd311: ; cd311 (33:5311)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .asm_cd31e
	call Functioncd38e
	ret
.asm_cd31e
	call Functionce72c

; no known jump sources
Functioncd321: ; cd321 (33:5321)
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $0

; no known jump sources
Functioncd32a: ; cd32a (33:532a)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .asm_cd363
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, $18
	call Functionce732
	sub $18
	sra a
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, $18
	call Functionce734
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, $f
	add hl, bc
	add [hl]
	ld [hl], a
	ret
.asm_cd363
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $f0
	jr z, .asm_cd37a
	sub $10
	ld d, a
	ld a, [hl]
	and $f
	or d
	ld [hl], a
	ld hl, $e
	add hl, bc
	dec [hl]
	ret
.asm_cd37a
	call Functionce72c

; no known jump sources
Functioncd37d: ; cd37d (33:537d)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $b0
	jr c, .asm_cd38a
	call Functioncc9bd
	ret
.asm_cd38a
	call Functioncd38e
	ret

; known jump sources: cd31a (33:531a), cd38a (33:538a)
Functioncd38e: ; cd38e (33:538e)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, $7
	add hl, bc
	add [hl]
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $f
	ld e, a
	srl e
	ld hl, $8
	add hl, bc
.asm_cd3a9
	dec [hl]
	dec e
	jr nz, .asm_cd3a9
	ret

; no known jump sources
Functioncd3ae: ; cd3ae (33:53ae)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd3b1: ; cd3b1 (33:53b1)
	dw Functioncd3b7
	dw Functioncd3cc
	dw Functioncd3ee


; no known jump sources
Functioncd3b7: ; cd3b7 (33:53b7)
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $0
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, $9
	add hl, bc
	ld [hl], a

; no known jump sources
Functioncd3cc: ; cd3cc (33:53cc)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cd3d6
	dec [hl]
	ret
.asm_cd3d6
	ld hl, $b
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	ld hl, $f
	add hl, bc
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ret

; no known jump sources
Functioncd3ee: ; cd3ee (33:53ee)
	call Functioncc9bd
	ret

; no known jump sources
Functioncd3f2: ; cd3f2 (33:53f2)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd3f5: ; cd3f5 (33:53f5)
	dw Functioncd409
	dw Functioncd45c
	dw Functioncd467
	dw Functioncd472
	dw Functioncd462
	dw Functioncd46d
	dw Functioncd477
	dw Functioncd41d
	dw Functioncd437
	dw Functioncd458


; no known jump sources
Functioncd409: ; cd409 (33:5409)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld hl, $e
	add hl, bc
	ld [hl], a
	cp $7
	jr z, Functioncd41d
	ld a, $11
	call Functionce7bf
	ret

; known jump sources: cd415 (33:5415)
Functioncd41d: ; cd41d (33:541d)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $88
	jr nc, .asm_cd42f
	add $2
	ld [hl], a
	ld hl, $8
	add hl, bc
	dec [hl]
	ret
.asm_cd42f
	call Functionce72c
	ld a, $10
	call Functionce7bf

; no known jump sources
Functioncd437: ; cd437 (33:5437)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, $10
	push af
	push de
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	inc [hl]
	ret

; no known jump sources
Functioncd458: ; cd458 (33:5458)
	call Functioncc9bd
	ret

; no known jump sources
Functioncd45c: ; cd45c (33:545c)
	ld hl, $a
	add hl, bc
	dec [hl]
	ret

; no known jump sources
Functioncd462: ; cd462 (33:5462)
	ld hl, $a
	add hl, bc
	inc [hl]

; no known jump sources
Functioncd467: ; cd467 (33:5467)
	ld hl, $9
	add hl, bc
	dec [hl]
	ret

; no known jump sources
Functioncd46d: ; cd46d (33:546d)
	ld hl, $a
	add hl, bc
	inc [hl]

; no known jump sources
Functioncd472: ; cd472 (33:5472)
	ld hl, $9
	add hl, bc
	inc [hl]

; no known jump sources
Functioncd477: ; cd477 (33:5477)
	ret

; no known jump sources
Functioncd478: ; cd478 (33:5478)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd47b: ; cd47b (33:547b)
	dw Functioncd48d
	dw Functioncd496
	dw Functioncd4ee
	dw Functioncd53a
	dw Functioncd545
	dw Functioncd545
	dw Functioncd545
	dw Functioncd545
	dw Functioncd549


; no known jump sources
Functioncd48d: ; cd48d (33:548d)
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $40

; no known jump sources
Functioncd496: ; cd496 (33:5496)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	cp $30
	jr nc, .asm_cd4bc
	call Functionce72c
	xor a
	ld hl, $f
	add hl, bc
	ld [hli], a
	ld [hl], a
	ld a, $17
	call Functionce7bf
	ld hl, $b
	add hl, bc
	bit 6, [hl]
	ret z
	ld hl, $d
	add hl, bc
	ld [hl], $5
	ret
.asm_cd4bc
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $3f
	ld d, a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	dec [hl]
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	call Functioncd557
	ld hl, $10
	add hl, bc
	ld a, [hl]
	ld hl, $7
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, $7
	add hl, bc
	ld [hl], d
	ld hl, $10
	add hl, bc
	ld [hl], e
	ret

; no known jump sources
Functioncd4ee: ; cd4ee (33:54ee)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	cp $20
	jr nz, .asm_cd4fb
	call Functioncc9bd
	ret
.asm_cd4fb
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, $10
	call Functionce734
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	bit 6, [hl]
	jr nz, .asm_cd519
	ld hl, $f
	add hl, bc
	inc [hl]
	jr .asm_cd51e
.asm_cd519
	ld hl, $f
	add hl, bc
	dec [hl]
.asm_cd51e
	ld de, $80
	ld hl, $10
	add hl, bc
	ld a, [hl]
	ld hl, $a
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, $a
	add hl, bc
	ld [hl], d
	ld hl, $10
	add hl, bc
	ld [hl], e
	ret

; no known jump sources
Functioncd53a: ; cd53a (33:553a)
	ld a, $16
	call Functionce7bf
	ld hl, $1
	add hl, bc
	res 5, [hl]

; no known jump sources
Functioncd545: ; cd545 (33:5545)
	call Functionce72c
	ret

; no known jump sources
Functioncd549: ; cd549 (33:5549)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $c0
	ret nc
	ld a, $8
	call Functionce70a
	ret

; known jump sources: cd4d2 (33:54d2), cd5cd (33:55cd)
Functioncd557: ; cd557 (33:5557)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	bit 7, a
	jr nz, .asm_cd574
	cp $20
	jr nc, .asm_cd570
	cp $18
	jr nc, .asm_cd56c
	ld de, $200
	ret
.asm_cd56c
	ld de, $180
	ret
.asm_cd570
	ld de, $100
	ret
.asm_cd574
	and $3f
	cp $20
	jr nc, .asm_cd586
	cp $18
	jr nc, .asm_cd582
	ld de, $fe00
	ret
.asm_cd582
	ld de, $fe80
	ret
.asm_cd586
	ld de, rJOYP ; $ff00
	ret

; no known jump sources
Functioncd58a: ; cd58a (33:558a)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd58d: ; cd58d (33:558d)
	dw Functioncd591
	dw Functioncd5aa


; no known jump sources
Functioncd591: ; cd591 (33:5591)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $40
	rlca
	rlca
	add $19
	ld hl, $3
	add hl, bc
	ld [hl], a
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $40

; no known jump sources
Functioncd5aa: ; cd5aa (33:55aa)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	cp $30
	jr nc, .asm_cd5b7
	call Functioncc9bd
	ret
.asm_cd5b7
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $3f
	ld d, a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	dec [hl]
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	call Functioncd557
	ld hl, $10
	add hl, bc
	ld a, [hl]
	ld hl, $7
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, $7
	add hl, bc
	ld [hl], d
	ld hl, $10
	add hl, bc
	ld [hl], e
	ret

; no known jump sources
Functioncd5e9: ; cd5e9 (33:55e9)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd5ec: ; cd5ec (33:55ec)
	dw Functioncd5f2
	dw Functioncd5fb
	dw Functioncd61b


; no known jump sources
Functioncd5f2: ; cd5f2 (33:55f2)
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $c

; no known jump sources
Functioncd5fb: ; cd5fb (33:55fb)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cd60d
	dec [hl]
	ld hl, $b
	add hl, bc
	ld a, [hl]
	call Functionce70a
	ret
.asm_cd60d
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $0
	ld a, $22
	call Functionce7bf

; no known jump sources
Functioncd61b: ; cd61b (33:561b)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $98
	jr nc, .asm_cd63f
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld hl, $7
	add hl, bc
	ld h, [hl]
	ld l, a
	ld de, $60
	add hl, de
	ld e, l
	ld d, h
	ld hl, $f
	add hl, bc
	ld [hl], e
	ld hl, $7
	add hl, bc
	ld [hl], d
.asm_cd63f
	ld hl, $8
	add hl, bc
	ld a, [hl]
	cp $20
	ret c
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $f0
	ld e, a
	ld d, $ff
	ld hl, $10
	add hl, bc
	ld a, [hl]
	ld hl, $8
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, $10
	add hl, bc
	ld [hl], e
	ld hl, $8
	add hl, bc
	ld [hl], d
	ret

; no known jump sources
Functioncd66a: ; cd66a (33:566a)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd66d: ; cd66d (33:566d)
	dw Functioncd677
	dw Functioncd687
	dw Functioncd6c5
	dw Functioncd6c6
	dw Functioncd6d6


; no known jump sources
Functioncd677: ; cd677 (33:5677)
	call Functionce72c
	ld a, $42
	ld [hLCDStatCustom], a ; $ff00+$c6
	ld a, $58
	ld [$FF00+$c7], a
	ld a, $5e
	ld [$FF00+$c8], a
	ret

; no known jump sources
Functioncd687: ; cd687 (33:5687)
	ld hl, $b
	add hl, bc
	ld e, [hl]
	ld hl, $8
	add hl, bc
	ld a, [hl]
	cp e
	jr nc, .asm_cd69b
	call Functionce72c
	xor a
	ld [$FF00+$c7], a
	ret
.asm_cd69b
	dec a
	ld [hl], a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, $10
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $8
	add hl, bc
	add [hl]
	sub $10
	ret c
	ld [$FF00+$c7], a
	ld hl, $9
	add hl, bc
	ld a, [hl]
	inc a
	and $7
	ld [hl], a
	ld hl, $f
	add hl, bc
	inc [hl]
	inc [hl]

; no known jump sources
Functioncd6c5: ; cd6c5 (33:56c5)
	ret

; no known jump sources
Functioncd6c6: ; cd6c6 (33:56c6)
	ld hl, $8
	add hl, bc
	ld a, [hl]
	cp $70
	jr c, asm_cd6da
	xor a
	ld [hLCDStatCustom], a ; $ff00+$c6
	ld [$FF00+$c7], a
	ld [$FF00+$c8], a

; no known jump sources
Functioncd6d6: ; cd6d6 (33:56d6)
	call Functioncc9bd
	ret
asm_cd6da: ; cd6da (33:56da)
	inc a
	inc a
	ld [hl], a
	sub $10
	ret c
	ld [$FF00+$c7], a
	ret

; no known jump sources
Functioncd6e3: ; cd6e3 (33:56e3)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd6e6: ; cd6e6 (33:56e6)
	dw Functioncd6ea
	dw Functioncd6f7


; no known jump sources
Functioncd6ea: ; cd6ea (33:56ea)
	call Functionce72c
	ld hl, $b
	add hl, bc
	ld a, $24
	add [hl]
	call Functionce7bf

; no known jump sources
Functioncd6f7: ; cd6f7 (33:56f7)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $b8
	jr c, .asm_cd704
	call Functioncc9bd
	ret
.asm_cd704
	ld a, $2
	call Functionce70a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld d, $8
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	ret

; no known jump sources
Functioncd71a: ; cd71a (33:571a)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd71d: ; cd71d (33:571d)
	dw Functioncd725
	dw Functioncd728
	dw Functioncd763
	dw Functioncd776


; no known jump sources
Functioncd725: ; cd725 (33:5725)
	call Functionce72c

; no known jump sources
Functioncd728: ; cd728 (33:5728)
	ld hl, $8
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_cd747
	ld a, $2
	call Functionce70a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld d, $8
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	ret
.asm_cd747
	call Functionce72c
	ld a, $28
	call Functionce7bf
	ld hl, $a
	add hl, bc
	ld [hl], $0
	ld hl, $8
	add hl, bc
	ld [hl], $30
	ld hl, $1
	add hl, bc
	ld a, [hl]
	and $1
	ld [hl], a

; no known jump sources
Functioncd763: ; cd763 (33:5763)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	cp $18
	jr nc, .asm_cd76e
	inc [hl]
	ret
.asm_cd76e
	call Functionce72c
	ld a, $29
	call Functionce7bf

; no known jump sources
Functioncd776: ; cd776 (33:5776)
	ret

; no known jump sources
Functioncd777: ; cd777 (33:5777)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	cp $38
	jr c, .asm_cd784
	call Functioncc9bd
	ret
.asm_cd784
	ld a, [hl]
	ld hl, $f
	add hl, bc
	ld l, [hl]
	ld h, a
	ld de, $80
	add hl, de
	ld e, l
	ld d, h
	ld hl, $f
	add hl, bc
	ld [hl], e
	ld hl, $a
	add hl, bc
	ld [hl], d
	ld hl, $9
	add hl, bc
	ld a, [hl]
	xor $10
	ld [hl], a
	ret

; no known jump sources
Functioncd7a4: ; cd7a4 (33:57a4)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd7a7: ; cd7a7 (33:57a7)
	dw Functioncd7ab
	dw Functioncd7d2


; no known jump sources
Functioncd7ab: ; cd7ab (33:57ab)
	call Functionce72c
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $f0
	ld hl, $10
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $f
	sla a
	sla a
	sla a
	ld hl, $f
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld [hl], $1

; no known jump sources
Functioncd7d2: ; cd7d2 (33:57d2)
	ld hl, $10
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_cd7de
	call Functioncc9bd
	ret
.asm_cd7de
	ld hl, $f
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, $10
	add hl, bc
	ld d, [hl]
	push af
	push de
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	xor $1
	ld [hl], a
	ret z
	ld hl, $10
	add hl, bc
	dec [hl]
	ret

; no known jump sources
Functioncd80c: ; cd80c (33:580c)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd80f: ; cd80f (33:580f)
	dw Functioncd81f
	dw Functioncd817
	dw Functioncd81f
	dw Functioncd820


; no known jump sources
Functioncd817: ; cd817 (33:5817)
	call Functionce72c
	ld a, $35
	call Functionce7bf

; no known jump sources
Functioncd81f: ; cd81f (33:581f)
	ret

; no known jump sources
Functioncd820: ; cd820 (33:5820)
	call Functioncc9bd
	ret

; no known jump sources
Functioncd824: ; cd824 (33:5824)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd827: ; cd827 (33:5827)
	dw Functioncd835
	dw Functioncd860
	dw Functioncd88f
	dw Functioncd88f
	dw Functioncd88f
	dw Functioncd88f
	dw Functioncd893


; no known jump sources
Functioncd835: ; cd835 (33:5835)
	call Functionce72c
	ld hl, $3
	add hl, bc
	ld a, [hl]
	ld hl, $10
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_cd852
	ld hl, $f
	add hl, bc
	ld [hl], $10
	jr .asm_cd858
.asm_cd852
	ld hl, $f
	add hl, bc
	ld [hl], $30
.asm_cd858
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a

; no known jump sources
Functioncd860: ; cd860 (33:5860)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld hl, $b
	add hl, bc
	ld d, [hl]
	call Functionce734
	ld hl, $9
	add hl, bc
	ld [hl], a
	bit 7, a
	jr nz, .asm_cd87e
	ld hl, $10
	add hl, bc
	ld a, [hl]
	inc a
	jr .asm_cd883
.asm_cd87e
	ld hl, $10
	add hl, bc
	ld a, [hl]
.asm_cd883
	call Functionce7bf
	ld hl, $f
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $1f
	ret nz

; no known jump sources
Functioncd88f: ; cd88f (33:588f)
	call Functionce72c
	ret

; no known jump sources
Functioncd893: ; cd893 (33:5893)
	ld hl, $e
	add hl, bc
	ld [hl], $1
	ret

; no known jump sources
Functioncd89a: ; cd89a (33:589a)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd89d: ; cd89d (33:589d)
	dw Functioncd8ab
	dw Functioncd8cc
	dw Functioncd8f5
	dw Functioncd8f5
	dw Functioncd8f5
	dw Functioncd8f5
	dw Functioncd8f9


; no known jump sources
Functioncd8ab: ; cd8ab (33:58ab)
	call Functionce72c
	ld hl, $b
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_cd8be
	ld hl, $f
	add hl, bc
	ld [hl], $10
	jr .asm_cd8c4
.asm_cd8be
	ld hl, $f
	add hl, bc
	ld [hl], $30
.asm_cd8c4
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a

; no known jump sources
Functioncd8cc: ; cd8cc (33:58cc)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld hl, $b
	add hl, bc
	ld d, [hl]
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	bit 7, a
	jr nz, .asm_cd8e6
	ld a, $3d
	jr .asm_cd8e8
.asm_cd8e6
	ld a, $3c
.asm_cd8e8
	call Functionce7bf
	ld hl, $f
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and $1f
	ret nz

; no known jump sources
Functioncd8f5: ; cd8f5 (33:58f5)
	call Functionce72c
	ret

; no known jump sources
Functioncd8f9: ; cd8f9 (33:58f9)
	ld hl, $e
	add hl, bc
	ld [hl], $1
	ret

; no known jump sources
Functioncd900: ; cd900 (33:5900)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd903: ; cd903 (33:5903)
	dw Functioncd907
	dw Functioncd913


; no known jump sources
Functioncd907: ; cd907 (33:5907)
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $28
	inc hl
	ld [hl], $0

; no known jump sources
Functioncd913: ; cd913 (33:5913)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld hl, $f
	add hl, bc
	ld d, [hl]
	push af
	push de
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cd950
	ld d, a
	ld hl, $10
	add hl, bc
	ld e, [hl]
	ld hl, hPushOAM ; $ff80
	add hl, de
	ld e, l
	ld d, h
	ld hl, $10
	add hl, bc
	ld [hl], e
	ld hl, $f
	add hl, bc
	ld [hl], d
	ret
.asm_cd950
	call Functioncc9bd
	ret

; no known jump sources
Functioncd954: ; cd954 (33:5954)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cd957: ; cd957 (33:5957)
	dw Functioncd961
	dw Functioncd96a
	dw Functioncd96e
	dw Functioncd96a
	dw Functioncd97b


; no known jump sources
Functioncd961: ; cd961 (33:5961)
	call Functionce72c
	ld hl, $b
	add hl, bc
	ld [hl], $0

; no known jump sources
Functioncd96a: ; cd96a (33:596a)
	call Functioncd99a
	ret

; no known jump sources
Functioncd96e: ; cd96e (33:596e)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $88
	jr c, asm_cd988
	call Functionce72c
	ret

; no known jump sources
Functioncd97b: ; cd97b (33:597b)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $b8
	jr c, asm_cd988
	call Functioncc9bd
	ret

; known jump sources: cd975 (33:5975), cd982 (33:5982)
asm_cd988: ; cd988 (33:5988)
	call Functioncd99a
	ld hl, $7
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $1
	ret nz
	ld hl, $8
	add hl, bc
	dec [hl]
	ret

; known jump sources: cd96a (33:596a), cd988 (33:5988)
Functioncd99a: ; cd99a (33:599a)
	call Functioncd9f4
	ld hl, $f
	add hl, bc
	ld a, [hl]
	push af
	push de
	call Functionce734
	sra a
	sra a
	sra a
	sra a
	ld hl, $b
	add hl, bc
	add [hl]
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	sub $8
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cd9d7
	cp $c2
	jr c, .asm_cd9e2
.asm_cd9d7
	dec a
	ld [hl], a
	and $7
	ret nz
	ld hl, $10
	add hl, bc
	inc [hl]
	ret
.asm_cd9e2
	xor a
	ld hl, $10
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld [hli], a
	ld [hl], a
	ret

; known jump sources: cd99a (33:599a)
Functioncd9f4: ; cd9f4 (33:59f4)
	ld hl, $10
	add hl, bc
	ld e, [hl]
	ld d, $0
	ld hl, $5a01
	add hl, de
	ld d, [hl]
	ret
; cda01 (33:5a01)

INCBIN "baserom.gbc",$cda01,$cda0a - $cda01

; no known jump sources
Functioncda0a: ; cda0a (33:5a0a)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $30
	jr nc, .asm_cda17
	call Functioncc9bd
	ret
.asm_cda17
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $f
	ld e, a
	ld hl, $7
	add hl, bc
	ld a, [hl]
	sub e
	ld [hl], a
	srl e
	ld hl, $8
	add hl, bc
.asm_cda2c
	inc [hl]
	dec e
	jr nz, .asm_cda2c
	ret

; no known jump sources
Functioncda31: ; cda31 (33:5a31)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cda34: ; cda34 (33:5a34)
	dw Functioncda4c
	dw Functioncda3a
	dw Functioncda4c


; no known jump sources
Functioncda3a: ; cda3a (33:5a3a)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	inc a
	call Functionce7bf
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $8

; no known jump sources
Functioncda4c: ; cda4c (33:5a4c)
	ret

; no known jump sources
Functioncda4d: ; cda4d (33:5a4d)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cda50: ; cda50 (33:5a50)
	dw Functioncda58
	dw Functioncda62
	dw Functioncda7a
	dw Functioncda8c


; no known jump sources
Functioncda58: ; cda58 (33:5a58)
	call Functionce72c
	ld hl, $10
	add hl, bc
	ld [hl], $40
	ret

; no known jump sources
Functioncda62: ; cda62 (33:5a62)
	ld hl, $10
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .asm_cda6f
	call Functioncda8d
	ret
.asm_cda6f
	ld [hl], $40
	ld a, $57
	call Functionce7bf
	call Functionce72c
	ret

; no known jump sources
Functioncda7a: ; cda7a (33:5a7a)
	ld hl, $10
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cda84
	dec [hl]
	ret
.asm_cda84
	call Functionce72c
	ld a, $58
	call Functionce7bf

; no known jump sources
Functioncda8c: ; cda8c (33:5a8c)
	ret

; known jump sources: cda6b (33:5a6b), cdaf2 (33:5af2)
Functioncda8d: ; cda8d (33:5a8d)
	dec [hl]
	ld d, $20
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $2
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	ld hl, $f
	add hl, bc
	ld e, [hl]
	ld hl, $7
	add hl, bc
	ld d, [hl]
	ld hl, $b
	add hl, bc
	ld h, [hl]
	ld a, h
	and $f
	swap a
	ld l, a
	ld a, h
	and $f0
	swap a
	ld h, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, $f
	add hl, bc
	ld [hl], e
	ld hl, $7
	add hl, bc
	ld [hl], d
	ld hl, $10
	add hl, bc
	ld a, [hl]
	and $1
	ret nz
	ld hl, $8
	add hl, bc
	dec [hl]
	ret

; no known jump sources
Functioncdad6: ; cdad6 (33:5ad6)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cdad9: ; cdad9 (33:5ad9)
	dw Functioncdadf
	dw Functioncdae9
	dw Functioncdaf9


; no known jump sources
Functioncdadf: ; cdadf (33:5adf)
	call Functionce72c
	ld hl, $10
	add hl, bc
	ld [hl], $40
	ret

; no known jump sources
Functioncdae9: ; cdae9 (33:5ae9)
	ld hl, $10
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .asm_cdaf6
	call Functioncda8d
	ret
.asm_cdaf6
	call Functionce72c

; no known jump sources
Functioncdaf9: ; cdaf9 (33:5af9)
	ret

; no known jump sources
Functioncdafa: ; cdafa (33:5afa)
	call Functioncd0e3
	ld hl, $f
	add hl, bc
	ld a, [hl]
	add $f
	ld [hl], a
	ret

; no known jump sources
Functioncdb06: ; cdb06 (33:5b06)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cdb09: ; cdb09 (33:5b09)
	dw Functioncdb13
	dw Functioncdb14
	dw Functioncdb28
	dw Functioncdb50
	dw Functioncdb65


; no known jump sources
Functioncdb13: ; cdb13 (33:5b13)
	ret

; no known jump sources
Functioncdb14: ; cdb14 (33:5b14)
	ld hl, $8
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_cdb24
	ld hl, $e
	add hl, bc
	ld [hl], $0
	ret
.asm_cdb24
	add $4
	ld [hl], a
	ret

; no known jump sources
Functioncdb28: ; cdb28 (33:5b28)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $98
	ret nc
	inc [hl]
	inc [hl]
	ld hl, $1
	add hl, bc
	set 0, [hl]
	ld hl, $2
	add hl, bc
	ld [hl], $90
	ld hl, $d
	add hl, bc
	ld [hl], $0
	ld hl, $c
	add hl, bc
	ld [hl], $2
	ld hl, $8
	add hl, bc
	dec [hl]
	ret

; no known jump sources
Functioncdb50: ; cdb50 (33:5b50)
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $2c
	ld hl, $d
	add hl, bc
	ld [hl], $0
	ld hl, $c
	add hl, bc
	ld [hl], $80

; no known jump sources
Functioncdb65: ; cdb65 (33:5b65)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $98
	ret nc
	inc [hl]
	inc [hl]
	ld hl, $f
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $8
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	ret

; no known jump sources
Functioncdb80: ; cdb80 (33:5b80)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cdb83: ; cdb83 (33:5b83)
	dw Functioncdb9f
	dw Functioncdbb3
	dw Functioncdbcf
	dw Functioncdbeb
	dw Functioncdc74
	dw Functioncdc1a
	dw Functioncdbc1
	dw Functioncdc1e
	dw Functioncdc27
	dw Functioncdc39
	dw Functioncdc74
	dw Functioncdc48
	dw Functioncdc57
	dw Functioncdc74


; no known jump sources
Functioncdb9f: ; cdb9f (33:5b9f)
	ld hl, $f
	add hl, bc
	ld [hl], $28
	inc hl
	ld [hl], $10
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld hl, $e
	add hl, bc
	ld [hl], a
	ret

; no known jump sources
Functioncdbb3: ; cdbb3 (33:5bb3)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .asm_cdbbd
	inc [hl]
.asm_cdbbd
	call Functioncdc75
	ret

; no known jump sources
Functioncdbc1: ; cdbc1 (33:5bc1)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $4b
	jr nc, .asm_cdbcb
	inc [hl]
.asm_cdbcb
	call Functioncdc75
	ret

; no known jump sources
Functioncdbcf: ; cdbcf (33:5bcf)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $88
	jr nc, .asm_cdbe6
	and $f
	jr nz, asm_cdbfa
	ld hl, $10
	add hl, bc
	ld [hl], $10
	call Functionce72c
	ret
.asm_cdbe6
	call Functionce72c
	inc [hl]
	ret

; no known jump sources
Functioncdbeb: ; cdbeb (33:5beb)
	ld hl, $10
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdbf5
	dec [hl]
	ret
.asm_cdbf5
	ld hl, $e
	add hl, bc
	dec [hl]
asm_cdbfa: ; cdbfa (33:5bfa)
	ld hl, $7
	add hl, bc
	inc [hl]
	ld hl, $8
	add hl, bc
	ld d, [hl]
	ld hl, $f
	add hl, bc
	ld e, [hl]
	ld hl, hPushOAM ; $ff80
	add hl, de
	ld e, l
	ld d, h
	ld hl, $8
	add hl, bc
	ld [hl], d
	ld hl, $f
	add hl, bc
	ld [hl], e
	ret

; no known jump sources
Functioncdc1a: ; cdc1a (33:5c1a)
	call Functioncc9bd
	ret

; no known jump sources
Functioncdc1e: ; cdc1e (33:5c1e)
	ld a, $4e
	call Functionce7bf
	call Functionce72c
	ret

; no known jump sources
Functioncdc27: ; cdc27 (33:5c27)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $2
	call Functionce734
	ld hl, $9
	add hl, bc
	ld [hl], a
	ret

; no known jump sources
Functioncdc39: ; cdc39 (33:5c39)
	ld a, $50
	call Functionce7bf
	ld hl, $a
	add hl, bc
	ld [hl], $4
	call Functionce72c
	ret

; no known jump sources
Functioncdc48: ; cdc48 (33:5c48)
	ld a, $4f
	call Functionce7bf
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $40
	ret

; no known jump sources
Functioncdc57: ; cdc57 (33:5c57)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, $20
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_cdc71
	dec [hl]
	ret
.asm_cdc71
	call Functionce72c

; no known jump sources
Functioncdc74: ; cdc74 (33:5c74)
	ret

; known jump sources: cdbbd (33:5bbd), cdbcb (33:5bcb)
Functioncdc75: ; cdc75 (33:5c75)
	ld hl, $f
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, $f
	add hl, bc
	ld [hl], $20
	ld hl, $10
	add hl, bc
	ld a, [hl]
	sub $8
	ld [hl], a
	ret nz
	xor a
	ld hl, $f
	add hl, bc
	ld [hli], a
	ld [hl], a
	call Functionce72c
	ret

; no known jump sources
Functioncdca6: ; cdca6 (33:5ca6)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdcb6
	cp $d8
	jr nc, .asm_cdcb6
	call Functioncc9bd
	ret
.asm_cdcb6
	ld hl, $b
	add hl, bc
	ld d, [hl]
	ld hl, $a
	add hl, bc
	ld a, [hl]
	sub d
	ld [hl], a
	ret

; no known jump sources
Functioncdcc3: ; cdcc3 (33:5cc3)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cdcc6: ; cdcc6 (33:5cc6)
	dw Functioncdcca
	dw Functioncdced


; no known jump sources
Functioncdcca: ; cdcca (33:5cca)
	ld a, [hBattleTurn] ; $ff00+$e4
	and a
	jr z, .asm_cdcd9
	ld hl, $b
	add hl, bc
	ld a, [hl]
	xor $ff
	add $3
	ld [hl], a
.asm_cdcd9
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $8
	ld hl, $b
	add hl, bc
	ld a, $59
	add [hl]
	call Functionce7bf
	ret

; no known jump sources
Functioncdced: ; cdced (33:5ced)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdcfa
	dec [hl]
	call Functioncdcfe
	ret
.asm_cdcfa
	call Functioncc9bd
	ret

; known jump sources: cdcf6 (33:5cf6)
Functioncdcfe: ; cdcfe (33:5cfe)
	ld hl, $10
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $10
	call Functionce734
	ld d, a
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdd20
	dec a
	ret z
	ld hl, $a
	add hl, bc
	ld [hl], d
	ret
.asm_cdd20
	ld hl, $a
	add hl, bc
	ld a, d
	xor $ff
	inc a
	ld [hl], a
	ret

; no known jump sources
Functioncdd2a: ; cdd2a (33:5d2a)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cdd2d: ; cdd2d (33:5d2d)
	dw Functioncdd31
	dw Functioncdd4f


; no known jump sources
Functioncdd31: ; cdd31 (33:5d31)
	call Functionce72c
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $3f
	ld hl, $10
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $80
	rlca
	ld [hl], a
	add $5d
	call Functionce7bf
	ret

; no known jump sources
Functioncdd4f: ; cdd4f (33:5d4f)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	swap a
	ld d, a
	ld hl, $10
	add hl, bc
	ld a, [hl]
	inc [hl]
	push af
	push de
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $80
	ret nc
	ld hl, $10
	add hl, bc
	ld a, [hl]
	and $3
	jr nz, .asm_cdd87
	ld hl, $8
	add hl, bc
	dec [hl]
.asm_cdd87
	and $1
	ret nz
	ld hl, $7
	add hl, bc
	inc [hl]
	ret

; no known jump sources
Functioncdd90: ; cdd90 (33:5d90)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cdd93: ; cdd93 (33:5d93)
	dw Functioncdd97
	dw Functioncddbc


; no known jump sources
Functioncdd97: ; cdd97 (33:5d97)
	call Functionce72c
	ld hl, $3
	add hl, bc
	ld a, [hl]
	ld hl, $f
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $80
	rlca
	ld hl, $f
	add hl, bc
	add [hl]
	call Functionce7bf
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a

; no known jump sources
Functioncddbc: ; cddbc (33:5dbc)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld d, $10
	push af
	push de
	call Functionce734
	sra a
	sra a
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $3f
	jr z, .asm_cddf0
	and $1f
	ret nz
	ld hl, $f
	add hl, bc
	ld a, [hl]
	inc a
	jr .asm_cddf5
.asm_cddf0
	ld hl, $f
	add hl, bc
	ld a, [hl]
.asm_cddf5
	call Functionce7bf
	ret

; no known jump sources
Functioncddf9: ; cddf9 (33:5df9)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cddfc: ; cddfc (33:5dfc)
	dw Functioncde02
	dw Functioncde20
	dw Functioncde21


; no known jump sources
Functioncde02: ; cde02 (33:5e02)
	call Functionce72c
	ld hl, $b
	add hl, bc
	ld a, [hl]
	add $63
	call Functionce7bf
	ld hl, $b
	add hl, bc
	ld e, [hl]
	ld d, $0
	ld hl, $5e25
	add hl, de
	ld a, [hl]
	ld hl, $a
	add hl, bc
	ld [hl], a

; no known jump sources
Functioncde20: ; cde20 (33:5e20)
	ret

; no known jump sources
Functioncde21: ; cde21 (33:5e21)
	call Functioncc9bd
	ret
; cde25 (33:5e25)

INCBIN "baserom.gbc",$cde25,$cde28 - $cde25

; no known jump sources
Functioncde28: ; cde28 (33:5e28)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $4
	call Functionce734
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $a
	add hl, bc
	ld d, [hl]
	ld hl, $10
	add hl, bc
	ld e, [hl]
	ld hl, $ffa0
	add hl, de
	ld e, l
	ld d, h
	ld hl, $a
	add hl, bc
	ld [hl], d
	ld hl, $10
	add hl, bc
	ld [hl], e
	ret

; no known jump sources
Functioncde54: ; cde54 (33:5e54)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	dec [hl]
	dec [hl]
	ld d, $10
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $7
	add hl, bc
	inc [hl]
	ret

; no known jump sources
Functioncde6b: ; cde6b (33:5e6b)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cde6e: ; cde6e (33:5e6e)
	dw Functioncde72
	dw Functioncde88


; no known jump sources
Functioncde72: ; cde72 (33:5e72)
	call Functionce72c
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_cde83
	ld hl, $1
	add hl, bc
	set 6, [hl]
.asm_cde83
	add $6a
	call Functionce7bf

; no known jump sources
Functioncde88: ; cde88 (33:5e88)
	ret

; no known jump sources
Functioncde89: ; cde89 (33:5e89)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cde8c: ; cde8c (33:5e8c)
	dw Functioncde90
	dw Functioncdebf


; no known jump sources
Functioncde90: ; cde90 (33:5e90)
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $0
	ld hl, $b
	add hl, bc
	ld e, [hl]
	ld a, e
	and $70
	swap a
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld a, e
	and $80
	jr nz, .asm_cdeb2
	ld a, e
	and $f
	ld [hl], a
	ret
.asm_cdeb2
	ld a, e
	and $f
	xor $ff
	inc a
	ld [hl], a
	ld a, $6e
	call Functionce7bf
	ret

; no known jump sources
Functioncdebf: ; cdebf (33:5ebf)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdec9
	dec [hl]
	ret
.asm_cdec9
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld hl, $f
	add hl, bc
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ret

; no known jump sources
Functioncdedd: ; cdedd (33:5edd)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call Functionce734
	sra a
	sra a
	sra a
	ld hl, $10
	add hl, bc
	add [hl]
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $7
	ret nz
	ld hl, $10
	add hl, bc
	ld a, [hl]
	cp $28
	jr nc, .asm_cdf17
	inc [hl]
	ret
.asm_cdf17
	call Functioncc9bd
	ret

; no known jump sources
Functioncdf1b: ; cdf1b (33:5f1b)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call Functionce734
	sra a
	sra a
	sra a
	ld hl, $10
	add hl, bc
	add [hl]
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3
	ret nz
	ld hl, $10
	add hl, bc
	ld a, [hl]
	cp $28
	jr nc, .asm_cdf55
	inc [hl]
	ret
.asm_cdf55
	call Functioncc9bd
	ret

; no known jump sources
Functioncdf59: ; cdf59 (33:5f59)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_cdf5c: ; cdf5c (33:5f5c)
	dw Functioncdf60
	dw Functioncdedd


; no known jump sources
Functioncdf60: ; cdf60 (33:5f60)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $84
	jr nc, .asm_cdf88
	inc [hl]
	ld hl, $f
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and $1
	ret nz
	ld hl, $8
	add hl, bc
	dec [hl]
	ret
.asm_cdf88
	call Functionce72c
	ret

; no known jump sources
Functioncdf8c: ; cdf8c (33:5f8c)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call Functionce734
	sra a
	sra a
	sra a
	ld hl, $10
	add hl, bc
	add [hl]
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and $7
	ret nz
	ld hl, $10
	add hl, bc
	ld a, [hl]
	cp $e8
	jr z, .asm_cdfc7
	dec [hl]
	ret
.asm_cdfc7
	call Functioncc9bd
	ret

; no known jump sources
Functioncdfcb: ; cdfcb (33:5fcb)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call Functionce734
	sra a
	sra a
	sra a
	ld hl, $10
	add hl, bc
	add [hl]
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and $3
	ret nz
	ld hl, $10
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .asm_ce007
	dec [hl]
	dec [hl]
	ret
.asm_ce007
	call Functioncc9bd
	ret

; no known jump sources
Functionce00b: ; ce00b (33:600b)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce00e: ; ce00e (33:600e)
	dw Functionce014
	dw Functionce023
	dw Functionce05f


; no known jump sources
Functionce014: ; ce014 (33:6014)
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $34
	ld hl, $10
	add hl, bc
	ld [hl], $10

; no known jump sources
Functionce023: ; ce023 (33:6023)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $6c
	jr c, .asm_ce02d
	ret
.asm_ce02d
	ld a, $2
	call Functionce70a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld hl, $10
	add hl, bc
	ld d, [hl]
	call Functionce734
	bit 7, a
	jr nz, .asm_ce046
	xor $ff
	inc a
.asm_ce046
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	sub $4
	ld [hl], a
	and $1f
	cp $20
	ret nz
	ld hl, $10
	add hl, bc
	srl [hl]
	ret

; no known jump sources
Functionce05f: ; ce05f (33:605f)
	call Functioncc9bd
	ret

; no known jump sources
Functionce063: ; ce063 (33:6063)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce066: ; ce066 (33:6066)
	dw Functionce06e
	dw Functionce083
	dw Functionce091
	dw Functionce09e


; no known jump sources
Functionce06e: ; ce06e (33:606e)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld hl, $e
	add hl, bc
	ld [hl], a
	ld hl, $8
	add hl, bc
	ld a, [hl]
	ld hl, $f
	add hl, bc
	ld [hl], a
	ret

; no known jump sources
Functionce083: ; ce083 (33:6083)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $58
	ret nc
	ld a, $2
	call Functionce70a
	ret

; no known jump sources
Functionce091: ; ce091 (33:6091)
	ld hl, $10
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, Functionce09e
	call Functioncc9bd
	ret

; known jump sources: ce098 (33:6098)
Functionce09e: ; ce09e (33:609e)
	ld hl, $10
	add hl, bc
	ld a, [hl]
	ld d, $8
	call Functionce734
	ld hl, $9
	add hl, bc
	ld [hl], a
	sra a
	xor $ff
	inc a
	ld hl, $f
	add hl, bc
	add [hl]
	ld hl, $8
	add hl, bc
	ld [hl], a
	ld hl, $10
	add hl, bc
	ld a, [hl]
	add $8
	ld [hl], a
	ret

; no known jump sources
Functionce0c5: ; ce0c5 (33:60c5)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce0c8: ; ce0c8 (33:60c8)
	dw Functionce0ce
	dw Functionce0f8
	dw Functionce0dd


; no known jump sources
Functionce0ce: ; ce0ce (33:60ce)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $f0
	swap a
	ld hl, $e
	add hl, bc
	ld [hl], a
	ret

; no known jump sources
Functionce0dd: ; ce0dd (33:60dd)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, $10
	call Functionce734
	ld hl, $a
	add hl, bc
	bit 7, a
	jr z, .asm_ce0f0
	ld [hl], a
.asm_ce0f0
	ld hl, $f
	add hl, bc
	ld a, [hl]
	sub $4
	ld [hl], a

; no known jump sources
Functionce0f8: ; ce0f8 (33:60f8)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $84
	jr c, .asm_ce105
	call Functioncc9bd
	ret
.asm_ce105
	ld hl, $b
	add hl, bc
	ld a, [hl]
	call Functionce70a
	ret

; no known jump sources
Functionce10e: ; ce10e (33:610e)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce111: ; ce111 (33:6111)
	dw Functionce115
	dw Functionce12a


; no known jump sources
Functionce115: ; ce115 (33:6115)
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $28
	ld hl, $8
	add hl, bc
	ld a, [hl]
	sub $28
	ld hl, $10
	add hl, bc
	ld [hl], a

; no known jump sources
Functionce12a: ; ce12a (33:612a)
	ld hl, $f
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld hl, $b
	add hl, bc
	and [hl]
	jr nz, .asm_ce149
	ld hl, $7
	add hl, bc
	dec [hl]
.asm_ce149
	ld hl, $f
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, $f
	add hl, bc
	ld [hl], $20
	inc hl
	srl [hl]
	ret

; no known jump sources
Functionce15c: ; ce15c (33:615c)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld hl, $f
	add hl, bc
	ld d, [hl]
	push af
	push de
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $1
	jr nz, .asm_ce189
	ld hl, $7
	add hl, bc
	dec [hl]
.asm_ce189
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $3
	jr nz, .asm_ce197
	ld hl, $8
	add hl, bc
	inc [hl]
.asm_ce197
	ld hl, $7
	add hl, bc
	ld a, [hl]
	ld hl, $f
	add hl, bc
	cp $5a
	jr nc, .asm_ce1aa
	ld a, [hl]
	and a
	jr z, .asm_ce1ac
	dec [hl]
	ret
.asm_ce1aa
	inc [hl]
	ret
.asm_ce1ac
	call Functioncc9bd
	ret

; no known jump sources
Functionce1b0: ; ce1b0 (33:61b0)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, $f
	add hl, bc
	ld d, [hl]
	push af
	push de
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $10
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, $f
	add hl, bc
	cp $40
	jr nc, .asm_ce1df
	inc [hl]
	ret
.asm_ce1df
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	call Functioncc9bd
	ret

; no known jump sources
Functionce1e7: ; ce1e7 (33:61e7)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce1ea: ; ce1ea (33:61ea)
	dw Functionce1ee
	dw Functionce1fb


; no known jump sources
Functionce1ee: ; ce1ee (33:61ee)
	call Functionce72c
	ld hl, $8
	add hl, bc
	ld a, [hl]
	ld hl, $10
	add hl, bc
	ld [hl], a

; no known jump sources
Functionce1fb: ; ce1fb (33:61fb)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld d, $30
	call Functionce734
	ld hl, $10
	add hl, bc
	add [hl]
	ld hl, $8
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	add $8
	ld d, $30
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	inc [hl]
	ret

; no known jump sources
Functionce226: ; ce226 (33:6226)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce229: ; ce229 (33:6229)
	dw Functionce22d
	dw Functionce254


; no known jump sources
Functionce22d: ; ce22d (33:622d)
	call Functionce72c
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld d, $10
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld d, $10
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $10
	add hl, bc
	ld [hl], $f

; no known jump sources
Functionce254: ; ce254 (33:6254)
	ret

; no known jump sources
Functionce255: ; ce255 (33:6255)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce258: ; ce258 (33:6258)
	dw Functionce260
	dw Functionce274
	dw Functionce278
	dw Functionce289


; no known jump sources
Functionce260: ; ce260 (33:6260)
	call Functionce72c
	ld a, [hBattleTurn] ; $ff00+$e4
	and a
	jr nz, .asm_ce26c
	ld a, $f0
	jr .asm_ce26e
.asm_ce26c
	ld a, $cc
.asm_ce26e
	ld hl, $f
	add hl, bc
	ld [hl], a
	ret

; no known jump sources
Functionce274: ; ce274 (33:6274)
	call Functionce29f
	ret

; no known jump sources
Functionce278: ; ce278 (33:6278)
	call Functionce29f
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $84
	ret nc
	ld a, $4
	call Functionce70a
	ret

; no known jump sources
Functionce289: ; ce289 (33:6289)
	call Functionce29f
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $d0
	jr nc, .asm_ce29b
	ld a, $4
	call Functionce70a
	ret
.asm_ce29b
	call Functioncc9bd
	ret

; known jump sources: ce274 (33:6274), ce278 (33:6278), ce289 (33:6289)
Functionce29f: ; ce29f (33:629f)
	ld hl, $10
	add hl, bc
	ld a, [hl]
	and $7
	inc [hl]
	srl a
	ld e, a
	ld d, $0
	ld a, [hSGB] ; $ff00+$e7
	and a
	jr nz, .asm_ce2b6
	ld hl, $62c4
	jr .asm_ce2b9
.asm_ce2b6
	ld hl, $62c8
.asm_ce2b9
	add hl, de
	ld a, [hl]
	ld hl, $f
	add hl, bc
	and [hl]
	ld [$cfc8], a
	ret
; ce2c4 (33:62c4)

INCBIN "baserom.gbc",$ce2c4,$ce2cc - $ce2c4

; no known jump sources
Functionce2cc: ; ce2cc (33:62cc)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld d, $18
	call Functionce734
	sra a
	sra a
	sra a
	ld hl, $10
	add hl, bc
	add [hl]
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $10
	add hl, bc
	dec [hl]
	dec [hl]
	ret

; no known jump sources
Functionce2fd: ; ce2fd (33:62fd)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce300: ; ce300 (33:6300)
	dw Functionce306
	dw Functionce330
	dw Functionce34c


; no known jump sources
Functionce306: ; ce306 (33:6306)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	cp $e0
	jr nz, .asm_ce319
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $2
	ret
.asm_ce319
	ld d, a
	ld hl, $f
	add hl, bc
	ld e, [hl]
	ld hl, hPushOAM ; $ff80
	add hl, de
	ld e, l
	ld d, h
	ld hl, $a
	add hl, bc
	ld [hl], d
	ld hl, $f
	add hl, bc
	ld [hl], e
	ret

; no known jump sources
Functionce330: ; ce330 (33:6330)
	ld hl, $10
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_ce33a
	dec [hl]
	ret
.asm_ce33a
	ld [hl], $4
	ld hl, $f
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ld hl, $a
	add hl, bc
	add [hl]
	ld [hl], a
	ret

; no known jump sources
Functionce34c: ; ce34c (33:634c)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $84
	jr nc, .asm_ce35b
	ld a, $4
	call Functionce70a
	ret
.asm_ce35b
	call Functioncc9bd
	ret

; no known jump sources
Functionce35f: ; ce35f (33:635f)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce362: ; ce362 (33:6362)
	dw Functionce366
	dw Functionce375


; no known jump sources
Functionce366: ; ce366 (33:6366)
	call Functionce72c
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $7f
	add $81
	call Functionce7bf

; no known jump sources
Functionce375: ; ce375 (33:6375)
	ld hl, $b
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_ce383
	ld hl, $9
	add hl, bc
	inc [hl]
	ret
.asm_ce383
	ld hl, $9
	add hl, bc
	dec [hl]
	ret

; no known jump sources
Functionce389: ; ce389 (33:6389)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce38c: ; ce38c (33:638c)
	dw Functionce392
	dw Functionce39c
	dw Functionce3ae


; no known jump sources
Functionce392: ; ce392 (33:6392)
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $c
	ret

; no known jump sources
Functionce39c: ; ce39c (33:639c)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_ce3a6
	dec [hl]
	ret
.asm_ce3a6
	call Functionce72c
	ld a, $20
	call Functionce7bf

; no known jump sources
Functionce3ae: ; ce3ae (33:63ae)
	ld hl, $a
	add hl, bc
	dec [hl]
	ret

; no known jump sources
Functionce3b4: ; ce3b4 (33:63b4)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	push af
	ld d, $2
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop af
	ld d, $8
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ret

; no known jump sources
Functionce3d2: ; ce3d2 (33:63d2)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .asm_ce3df
	call Functioncc9bd
	ret
.asm_ce3df
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld d, $8
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	and $7
	ret nz
	ld hl, $a
	add hl, bc
	inc [hl]
	ret

; no known jump sources
Functionce3ff: ; ce3ff (33:63ff)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce402: ; ce402 (33:6402)
	dw Functionce406
	dw Functionce412


; no known jump sources
Functionce406: ; ce406 (33:6406)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld hl, $7
	add hl, bc
	add [hl]
	ld [hl], a
	ret

; no known jump sources
Functionce412: ; ce412 (33:6412)
	call Functioncc9bd
	ret

; no known jump sources
Functionce416: ; ce416 (33:6416)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	sra a
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	inc [hl]
	ret

; no known jump sources
Functionce43a: ; ce43a (33:643a)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce43d: ; ce43d (33:643d)
	dw Functionce443
	dw Functionce465
	dw Functionce490


; no known jump sources
Functionce443: ; ce443 (33:6443)
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $28
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, $3
	add hl, bc
	add [hl]
	call Functionce7bf
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and $f0
	or $8
	ld [hl], a

; no known jump sources
Functionce465: ; ce465 (33:6465)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_ce48b
	dec [hl]
	add $8
	ld d, a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	push af
	push de
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ret
.asm_ce48b
	ld [hl], $10
	call Functionce72c

; no known jump sources
Functionce490: ; ce490 (33:6490)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	call Functioncc9bd
	ret

; no known jump sources
Functionce49c: ; ce49c (33:649c)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce49f: ; ce49f (33:649f)
	dw Functionce4a3
	dw Functionce4b0


; no known jump sources
Functionce4a3: ; ce4a3 (33:64a3)
	call Functionce72c
	ld hl, $b
	add hl, bc
	ld a, $24
	add [hl]
	call Functionce7bf

; no known jump sources
Functionce4b0: ; ce4b0 (33:64b0)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	cp $38
	jr nc, .asm_ce4d8
	inc [hl]
	ld hl, $f
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ld hl, $8
	add hl, bc
	ld a, [hl]
	and $1
	ret nz
	ld hl, $7
	add hl, bc
	dec [hl]
	ret
.asm_ce4d8
	call Functioncc9bd
	ret

; no known jump sources
Functionce4dc: ; ce4dc (33:64dc)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld d, a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	inc [hl]
	call Functionce734
	bit 7, a
	jr nz, .asm_ce4f4
	xor $ff
	inc a
.asm_ce4f4
	ld hl, $a
	add hl, bc
	ld [hl], a
	ld hl, $f
	add hl, bc
	ld a, [hl]
	and $1f
	ret nz
	ld hl, $b
	add hl, bc
	srl [hl]
	ret

; no known jump sources
Functionce508: ; ce508 (33:6508)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	cp $10
	jr nc, .asm_ce52e
	inc [hl]
	inc [hl]
	ld d, a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	push af
	push de
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ret
.asm_ce52e
	call Functioncc9bd
	ret

; no known jump sources
Functionce532: ; ce532 (33:6532)
	ld hl, $b
	add hl, bc
	ld e, [hl]
	ld hl, $f
	add hl, bc
	ld d, [hl]
	ld a, e
	and $c0
	rlca
	rlca
	add [hl]
	ld [hl], a
	ld a, e
	and $3f
	push af
	push de
	call Functionce734
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ret

; no known jump sources
Functionce55b: ; ce55b (33:655b)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce55e: ; ce55e (33:655e)
	dw Functionce564
	dw Functionce56e
	dw Functionce577


; no known jump sources
Functionce564: ; ce564 (33:6564)
	ld d, $18
	ld hl, $b
	add hl, bc
	ld a, [hl]
	inc [hl]
	jr asm_ce58f

; no known jump sources
Functionce56e: ; ce56e (33:656e)
	call Functionce72c
	ld hl, $f
	add hl, bc
	ld [hl], $18

; no known jump sources
Functionce577: ; ce577 (33:6577)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .asm_ce58b
	ld d, a
	add $8
	ld [hl], a
	ld hl, $b
	add hl, bc
	ld a, [hl]
	jr asm_ce58f
.asm_ce58b
	call Functioncc9bd
	ret
asm_ce58f: ; ce58f (33:658f)
	call Functionce6f1
	ret

; no known jump sources
Functionce593: ; ce593 (33:6593)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce596: ; ce596 (33:6596)
	dw Functionce5b3
	dw Functionce59a


; no known jump sources
Functionce59a: ; ce59a (33:659a)
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_ce5b0
	ld hl, $7
	add hl, bc
	dec [hl]
	dec [hl]
	ld hl, $8
	add hl, bc
	inc [hl]
	inc [hl]
	ret
.asm_ce5b0
	call Functioncc9bd

; no known jump sources
Functionce5b3: ; ce5b3 (33:65b3)
	ret

; no known jump sources
Functionce5b4: ; ce5b4 (33:65b4)
	ld d, $50
	ld hl, $b
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	push af
	push de
	call Functionce734
	sra a
	sra a
	ld hl, $f
	add hl, bc
	add [hl]
	inc [hl]
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ret

; no known jump sources
Functionce5dc: ; ce5dc (33:65dc)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .asm_ce5ea
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret
.asm_ce5ea
	call Functioncc9bd
	ret

; no known jump sources
Functionce5ee: ; ce5ee (33:65ee)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce5f1: ; ce5f1 (33:65f1)
	dw Functionce5f9
	dw Functionce60a
	dw Functionce622
	dw Functionce618


; no known jump sources
Functionce5f9: ; ce5f9 (33:65f9)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and a
	jr nz, asm_ce61c
	call Functionce72c
	ld hl, $a
	add hl, bc
	ld [hl], $ec

; no known jump sources
Functionce60a: ; ce60a (33:660a)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	cp $4
	jr z, Functionce618
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ret

; known jump sources: ce611 (33:6611)
Functionce618: ; ce618 (33:6618)
	call Functioncc9bd
	ret
asm_ce61c: ; ce61c (33:661c)
	call Functionce72c
	call Functionce72c

; no known jump sources
Functionce622: ; ce622 (33:6622)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	cp $d8
	ret z
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret

; no known jump sources
Functionce62f: ; ce62f (33:662f)
	call Functionce71e ;  ;  ; call does not return

; no known jump sources
Jumptable_ce632: ; ce632 (33:6632)
	dw Functionce63a
	dw Functionce648
	dw Functionce65c
	dw Functionce672


; no known jump sources
Functionce63a: ; ce63a (33:663a)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld hl, $e
	add hl, bc
	ld [hl], a
	call Functionce72c
	ret

; no known jump sources
Functionce648: ; ce648 (33:6648)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	add $4
	cp $70
	jr c, .asm_ce654
	xor a
.asm_ce654
	ld [hl], a
	ld hl, $9
	add hl, bc
	inc [hl]
	inc [hl]
	ret

; no known jump sources
Functionce65c: ; ce65c (33:665c)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	add $4
	cp $70
	jr c, .asm_ce668
	xor a
.asm_ce668
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld a, [hl]
	add $8
	ld [hl], a
	ret

; no known jump sources
Functionce672: ; ce672 (33:6672)
	ld hl, $a
	add hl, bc
	ld a, [hl]
	add $4
	cp $70
	jr c, .asm_ce67e
	xor a
.asm_ce67e
	ld [hl], a
	ld hl, $9
	add hl, bc
	ld a, [hl]
	add $4
	ld [hl], a
	ret

; no known jump sources
Functionce688: ; ce688 (33:6688)
	ld hl, $7
	add hl, bc
	ld d, [hl]
	ld hl, $f
	add hl, bc
	ld e, [hl]
	ld hl, $b
	add hl, bc
	ld a, [hl]
	ld l, a
	and $f0
	ld h, a
	swap a
	or h
	ld h, a
	ld a, l
	and $f
	swap a
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, $7
	add hl, bc
	ld [hl], d
	ld hl, $f
	add hl, bc
	ld [hl], e
	ret

; no known jump sources
Functionce6b3: ; ce6b3 (33:66b3)
	ld d, $18
	ld hl, $b
	add hl, bc
	ld a, [hl]
	inc [hl]
	call Functionce6f1
	ret

; no known jump sources
Functionce6bf: ; ce6bf (33:66bf)
	ld d, $18
	ld hl, $10
	add hl, bc
	ld a, [hl]
	inc [hl]
	srl a
	ld hl, $b
	add hl, bc
	add [hl]
	call Functionce6f1
	ret

; no known jump sources
Functionce6d2: ; ce6d2 (33:66d2)
	ld hl, $f
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .asm_ce6ed
	inc [hl]
	ld hl, $b
	add hl, bc
	ld d, [hl]
	call Functionce734
	xor $ff
	inc a
	ld hl, $a
	add hl, bc
	ld [hl], a
	ret
.asm_ce6ed
	call Functioncc9bd
	ret

; known jump sources: ce58f (33:658f), ce6bb (33:66bb), ce6ce (33:66ce)
Functionce6f1: ; ce6f1 (33:66f1)
	push af
	push de
	call Functionce734
	sra a
	sra a
	ld hl, $a
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call Functionce732
	ld hl, $9
	add hl, bc
	ld [hl], a
	ret

; known jump sources: cd142 (33:5142), cd154 (33:5154), cd2ad (33:52ad), cd553 (33:5553), cd609 (33:5609), cd706 (33:5706), cd733 (33:5733), ce02f (33:602f), ce08d (33:608d), ce10a (33:610a), ce285 (33:6285), ce297 (33:6297), ce357 (33:6357)
Functionce70a: ; ce70a (33:670a)
	and $f
	ld e, a
	ld hl, $7
	add hl, bc
	add [hl]
	ld [hl], a
	srl e
	ld hl, $8
	add hl, bc
.asm_ce719
	dec [hl]
	dec e
	jr nz, .asm_ce719
	ret

; known jump sources: cd06e (33:506e), cd0e3 (33:50e3), cd12a (33:512a), cd15c (33:515c), cd212 (33:5212), cd284 (33:5284), cd2be (33:52be), cd306 (33:5306), cd3ae (33:53ae), cd3f2 (33:53f2), cd478 (33:5478), cd58a (33:558a), cd5e9 (33:55e9), cd66a (33:566a), cd6e3 (33:56e3), cd71a (33:571a), cd7a4 (33:57a4), cd80c (33:580c), cd824 (33:5824), cd89a (33:589a), cd900 (33:5900), cd954 (33:5954), cda31 (33:5a31), cda4d (33:5a4d), cdad6 (33:5ad6), cdb06 (33:5b06), cdb80 (33:5b80), cdcc3 (33:5cc3), cdd2a (33:5d2a), cdd90 (33:5d90), cddf9 (33:5df9), cde6b (33:5e6b), cde89 (33:5e89), cdf59 (33:5f59), ce00b (33:600b), ce063 (33:6063), ce0c5 (33:60c5), ce10e (33:610e), ce1e7 (33:61e7), ce226 (33:6226), ce255 (33:6255), ce2fd (33:62fd), ce35f (33:635f), ce389 (33:6389), ce3ff (33:63ff), ce43a (33:643a), ce49c (33:649c), ce55b (33:655b), ce593 (33:6593), ce5ee (33:65ee), ce62f (33:662f)
Functionce71e: ; ce71e (33:671e)
	pop de
	ld hl, $e
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

; known jump sources: cd0ea (33:50ea), cd17a (33:517a), cd192 (33:5192), cd196 (33:5196), cd1ce (33:51ce), cd1e5 (33:51e5), cd20a (33:520a), cd21e (33:521e), cd22f (33:522f), cd2b5 (33:52b5), cd2c5 (33:52c5), cd31e (33:531e), cd321 (33:5321), cd37a (33:537a), cd3b7 (33:53b7), cd42f (33:542f), cd48d (33:548d), cd49f (33:549f), cd545 (33:5545), cd5a1 (33:55a1), cd5f2 (33:55f2), cd60d (33:560d), cd677 (33:5677), cd694 (33:5694), cd6ea (33:56ea), cd725 (33:5725), cd747 (33:5747), cd76e (33:576e), cd7ab (33:57ab), cd817 (33:5817), cd835 (33:5835), cd88f (33:588f), cd8ab (33:58ab), cd8f5 (33:58f5), cd907 (33:5907), cd961 (33:5961), cd977 (33:5977), cda43 (33:5a43), cda58 (33:5a58), cda76 (33:5a76), cda84 (33:5a84), cdadf (33:5adf), cdaf6 (33:5af6), cdb50 (33:5b50), cdbe2 (33:5be2), cdbe6 (33:5be6), cdc23 (33:5c23), cdc44 (33:5c44), cdc4d (33:5c4d), cdc71 (33:5c71), cdca2 (33:5ca2), cdcd9 (33:5cd9), cdd31 (33:5d31), cdd97 (33:5d97), cde02 (33:5e02), cde72 (33:5e72), cde90 (33:5e90), cdf88 (33:5f88), ce014 (33:6014), ce115 (33:6115), ce1ee (33:61ee), ce22d (33:622d), ce260 (33:6260), ce30f (33:630f), ce366 (33:6366), ce392 (33:6392), ce3a6 (33:63a6), ce443 (33:6443), ce48d (33:648d), ce4a3 (33:64a3), ce56e (33:656e), ce601 (33:6601), ce61c (33:661c), ce61f (33:661f), ce644 (33:6644)
Functionce72c: ; ce72c (33:672c)
	ld hl, $e
	add hl, bc
	inc [hl]
	ret

; known jump sources: cd0d2 (33:50d2), cd11c (33:511c), cd33a (33:533a), cd44a (33:544a), cd7f5 (33:57f5), cd929 (33:5929), cd9bb (33:59bb), cdd69 (33:5d69), cddd3 (33:5dd3), cdefb (33:5efb), cdf39 (33:5f39), cdf72 (33:5f72), cdfaa (33:5faa), cdfe9 (33:5fe9), ce172 (33:6172), ce1c7 (33:61c7), ce218 (33:6218), ce246 (33:6246), ce2ee (33:62ee), ce3c9 (33:63c9), ce3e6 (33:63e6), ce429 (33:6429), ce482 (33:6482), ce4c2 (33:64c2), ce525 (33:6525), ce552 (33:6552), ce5d3 (33:65d3), ce701 (33:6701), ce76c (33:676c)
Functionce732: ; ce732 (33:6732)
	add $10

; known jump sources: cd09c (33:509c), cd0c8 (33:50c8), cd112 (33:5112), cd1ad (33:51ad), cd1f4 (33:51f4), cd2d7 (33:52d7), cd34d (33:534d), cd440 (33:5440), cd4ca (33:54ca), cd502 (33:5502), cd5c5 (33:55c5), cd6a4 (33:56a4), cd711 (33:5711), cd73e (33:573e), cd7eb (33:57eb), cd86a (33:586a), cd8d6 (33:58d6), cd91f (33:591f), cd9a4 (33:59a4), cda90 (33:5a90), cdb77 (33:5b77), cdc30 (33:5c30), cdc5e (33:5c5e), cdc7b (33:5c7b), cdd07 (33:5d07), cdd5f (33:5d5f), cddc5 (33:5dc5), cde31 (33:5e31), cde5d (33:5e5d), cdee6 (33:5ee6), cdf24 (33:5f24), cdf95 (33:5f95), cdfd4 (33:5fd4), ce03c (33:603c), ce0a5 (33:60a5), ce0e4 (33:60e4), ce130 (33:6130), ce168 (33:6168), ce1bd (33:61bd), ce202 (33:6202), ce237 (33:6237), ce2d3 (33:62d3), ce3be (33:63be), ce41f (33:641f), ce478 (33:6478), ce4ea (33:64ea), ce51b (33:651b), ce548 (33:6548), ce5bf (33:65bf), ce6e1 (33:66e1), ce6f3 (33:66f3), ce766 (33:6766)
Functionce734: ; ce734 (33:6734)
	and $3f
	cp $20
	jr nc, .asm_ce73f
	call Functionce749
	ld a, h
	ret
.asm_ce73f
	and $1f
	call Functionce749
	ld a, h
	xor $ff
	inc a
	ret

; known jump sources: ce73a (33:673a), ce741 (33:6741)
Functionce749: ; ce749 (33:6749)
	ld e, a
	ld a, d
	ld d, $0
	ld hl, $677f
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
.asm_ce758
	srl a
	jr nc, .asm_ce75d
	add hl, de
.asm_ce75d
	sla e
	rl d
	and a
	jr nz, .asm_ce758
	ret

; no known jump sources
Functionce765: ; ce765 (33:6765)
	ld a, e
	call Functionce734
	ld e, a
	ret

; no known jump sources
Functionce76b: ; ce76b (33:676b)
	ld a, e
	call Functionce732
	ld e, a
	ret
; ce771 (33:6771)

INCBIN "baserom.gbc",$ce771,$ce7bf - $ce771

; known jump sources: cd18f (33:518f), cd19b (33:519b), cd1cb (33:51cb), cd1d4 (33:51d4), cd1e2 (33:51e2), cd2ba (33:52ba), cd419 (33:5419), cd434 (33:5434), cd4ab (33:54ab), cd53c (33:553c), cd618 (33:5618), cd6f4 (33:56f4), cd74c (33:574c), cd773 (33:5773), cd81c (33:581c), cd883 (33:5883), cd8e8 (33:58e8), cda40 (33:5a40), cda73 (33:5a73), cda89 (33:5a89), cdc20 (33:5c20), cdc3b (33:5c3b), cdc4a (33:5c4a), cdce9 (33:5ce9), cdd4b (33:5d4b), cddb1 (33:5db1), cddf5 (33:5df5), cde0c (33:5e0c), cde85 (33:5e85), cdebb (33:5ebb), ce372 (33:6372), ce3ab (33:63ab), ce458 (33:6458), ce4ad (33:64ad)
Functionce7bf: ; ce7bf (33:67bf)
	ld hl, $3
	add hl, bc
	ld [hl], a
	ld hl, $c
	add hl, bc
	ld [hl], $0
	ld hl, $d
	add hl, bc
	ld [hl], $ff
	ret


Functionce7d1: ; ce7d1
.asm_ce7d1
	ld hl, $000c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_ce7e1
	dec [hl]
	call Functionce823
	ld a, [hli]
	push af
	jr .asm_ce7fd

.asm_ce7e1
	ld hl, $000d
	add hl, bc
	inc [hl]
	call Functionce823
	ld a, [hli]
	cp $fe
	jr z, .asm_ce815
	cp $ff
	jr z, .asm_ce807
	push af
	ld a, [hl]
	push hl
	and $3f
	ld hl, $000c
	add hl, bc
	ld [hl], a
	pop hl

.asm_ce7fd
	ld a, [hl]
	and $c0
	srl a
	ld [$d420], a
	pop af
	ret

.asm_ce807
	xor a
	ld hl, $000c
	add hl, bc
	ld [hl], a
	ld hl, $000d
	add hl, bc
	dec [hl]
	dec [hl]
	jr .asm_ce7d1

.asm_ce815
	xor a
	ld hl, $000c
	add hl, bc
	ld [hl], a
	dec a
	ld hl, $000d
	add hl, bc
	ld [hl], a
	jr .asm_ce7d1
; ce823

Functionce823: ; ce823
	ld hl, $0003
	add hl, bc
	ld e, [hl]
	ld d, $0
	ld hl, $685e
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $000d
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ret
; ce83c

Functionce83c: ; ce83c
	ld l, a
	ld h, $0
	ld de, $6eae
	add hl, hl
	add hl, hl
	add hl, de
	ret
; ce846


; known jump sources: cc4b0 (33:44b0)
Functionce846: ; ce846 (33:6846)
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, AnimObjGFX
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	push bc
	call Functione73
	pop bc
	ret
; ce85e (33:685e)


INCBIN "baserom.gbc", $ce85e, $cfcf6 - $ce85e


AnimObjGFX: ; cfcf6

object_gfx: MACRO
; label, # tiles
	db \2
	db BANK(\1)
	dw \1
ENDM

	object_gfx AnimObj00GFX, 0
	object_gfx AnimObj01GFX, 21
	object_gfx AnimObj02GFX, 6
	object_gfx AnimObj03GFX, 6
	object_gfx AnimObj04GFX, 20
	object_gfx AnimObj05GFX, 26
	object_gfx AnimObj06GFX, 18
	object_gfx AnimObj07GFX, 12
	object_gfx AnimObj08GFX, 9
	object_gfx AnimObj09GFX, 17
	object_gfx AnimObj10GFX, 6
	object_gfx AnimObj11GFX, 10
	object_gfx AnimObj12GFX, 9
	object_gfx AnimObj13GFX, 13
	object_gfx AnimObj14GFX, 16
	object_gfx AnimObj15GFX, 2
	object_gfx AnimObj16GFX, 11
	object_gfx AnimObj17GFX, 9
	object_gfx AnimObj18GFX, 9
	object_gfx AnimObj19GFX, 19
	object_gfx AnimObj20GFX, 10
	object_gfx AnimObj21GFX, 12
	object_gfx AnimObj22GFX, 18
	object_gfx AnimObj23GFX, 13
	object_gfx AnimObj24GFX, 10
	object_gfx AnimObj25GFX, 27
	object_gfx AnimObj26GFX, 12
	object_gfx AnimObj27GFX, 14
	object_gfx AnimObj28GFX, 16
	object_gfx AnimObj29GFX, 7
	object_gfx AnimObj30GFX, 8
	object_gfx AnimObj31GFX, 40
	object_gfx AnimObj32GFX, 36
	object_gfx AnimObj33GFX, 16
	object_gfx AnimObj34GFX, 48
	object_gfx AnimObj35GFX, 18
	object_gfx AnimObj36GFX, 38
	object_gfx AnimObj37GFX, 35
	object_gfx AnimObj38GFX, 18
	object_gfx AnimObj39GFX, 24
	object_gfx NULL, 1
	object_gfx NULL, 1
; cfd9e

