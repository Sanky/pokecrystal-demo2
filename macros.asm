; rgbds macros

dwb: MACRO
	dw \1
	db \2
	ENDM

dbw: MACRO
	db \1
	dw \2
	ENDM

dn: MACRO
	db \1 << 4 + \2
	ENDM

dt: MACRO ; three-byte (big-endian)
	db (\1 >> 16) & $ff
	db (\1 >> 8) & $ff
	db \1 & $ff
	ENDM

bigdw: MACRO ; big-endian word
	dw ((\1)/$100) + (((\1)&$ff)*$100)
	ENDM

callab: MACRO ; address, bank
	ld hl, \1
	ld a, BANK(\1)
	rst FarCall
	ENDM

callba: MACRO ; bank, address
	ld a, BANK(\1)
	ld hl, \1
	rst FarCall
	ENDM


lb: MACRO ; r, hi, lo
	ld \1, \2 << 8 + \3
	ENDM


; Constant enumeration

const_def: MACRO
const_value SET 0
ENDM

const: MACRO
\1 EQU const_value
const_value SET const_value + 1
ENDM


TX_RAM: MACRO
	db 1
	dw \1
	ENDM

TX_FAR: MACRO
	db $16
	dw \1
	db BANK(\1)
	ENDM

RGB: MACRO
	dw ((\3 << 10) | (\2 << 5) | (\1))
	ENDM


note: MACRO
	db \1 << 4 + (\2 - 1)
	ENDM

; pitch
__ EQU 0
C_ EQU 1
C# EQU 2
D_ EQU 3
D# EQU 4
E_ EQU 5
F_ EQU 6
F# EQU 7
G_ EQU 8
G# EQU 9
A_ EQU 10
A# EQU 11
B_ EQU 12


; It's better to use *coord than FuncCoord.
FuncCoord: MACRO
Coord = $c4a0 + 20 * \2 + \1
	ENDM

bccoord: MACRO
	FuncCoord \1, \2
	ld bc, Coord
	ENDM
	
decoord: MACRO
	FuncCoord \1, \2
	ld de, Coord
	ENDM

hlcoord: MACRO
	FuncCoord \1, \2
	ld hl, Coord
	ENDM


; pic animations
frame: MACRO
	db \1
	db \2
	ENDM
setrepeat: MACRO
	db $fe
	db \1
	ENDM
dorepeat: MACRO
	db $fd
	db \1
	ENDM
endanim: MACRO
	db $ff
	ENDM

