; CISC 225, Computer Organization
; Project: Sum Array
;
; Calculate the sum of an array of quadwords leaving the sum in the RAX
; register. The code should be written such that the number of interations
; of any loop code is dependent on the size of the array.

global _start		; exposes program entry point to the linker

section .text		; start of code segment

_start:

	mov rax,0						; initialize running sum 
	mov rcx,array1_length			; set up loop counter 
	mov rsi,0						; offset of first array element 
L1:
	add rax,[array1+rsi]			; add array element to sum 
	add rsi,8						; update offset to next array element 
	loop L1 						; process next array element

	; End the program
	mov		rax, 0x3c				; system call for exit
	xor		rdi, rdi				; exit code 0
	syscall					  		; invoke operating system call

section .data		; start of initialized data segment

	array1 dq 4,-8,1,-4,2,6
	array1_length equ ($-array1)/8


section .bss		; start of uninitialized data segment
