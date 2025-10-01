; Northampton Community College
; CISC 225, Computer Organization
; Exercise: Tally Positive/Negative Array Elements

global _start		; exposes program entry point to the linker

section .text		; start of code segment

_start:

	mov rsi,array1       ; Address of first element
	mov rcx,array1_len   ; Loop counter
L1:
	cmp qword[rsi],0
	jl L_NEG 
	inc qword[count_positive]
	jmp L_END
L_NEG:
	inc qword[count_negative]
L_END:
	add rsi,8            ; Advance to next array element
	loop L1              ; Next element

	; End the program
	mov		rax, 0x3c				; system call for exit
	xor		rdi, rdi				; exit code 0
	syscall							; invoke operating system call

section .data		; start of initialized data segment

  array1 dq 10,-3,21,6,-7,0,14,8
  array1_len equ ($-array1)/8
  count_positive dq 0 ; Expected value: 6 (if including zero)
  count_negative dq 0 ; Expected value: 2

section .bss		; start of uninitialized data segment

