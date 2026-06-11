section .data

arg db 'Usage error./ program<filename>',10
len_a equ $ - arg
open db "File cannot be open",10
len_o equ $ - open 


section .bss
buffer resb 512
fd resq 1

section .text
global _start
_start:
pop rax

cmp rax,2
jl Arg_Error

pop rsi
pop rdi

;open the file
mov rax,2
mov rsi,0
syscall

cmp rax,0
jl Open_Error

mov [fd],rax
;read the file
mov rax,0
mov rdi,[fd]
mov rsi,buffer
mov rdx,512
syscall

;write to the file
mov rdx,rax
mov rax,1
mov rdi,1
mov rsi,buffer
syscall


;close
mov rax,3
mov rdi,[fd]
syscall
jmp Exit

Arg_Error:
mov rax,1
mov rdi,1
mov rsi,arg
mov rdx,len_a
syscall
jmp Exit

Open_Error:
mov rax,1
mov rdi,1
mov rsi,open
mov rdx,len_o
syscall
jmp Exit

Exit:
mov rax,60
xor rdi,rdi
syscall

