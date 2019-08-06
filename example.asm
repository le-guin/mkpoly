
cpu x86-64

%include "mkpoly.inc"

extern puts

global main

section .data
	message db "Hello World!", 0x00

section .text

main:
	call    decrypt
	call    hello
	xor     rax, rax
	ret

decrypt:
	DECRYPTOR_SECTION hello, hello.end-hello
	ret

align 16
hello:
	lea     rdi, [rel message]
	call    puts
	ret
align 16
.end:

