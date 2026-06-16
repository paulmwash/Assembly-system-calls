section .data
filename db "test.txt",0
error db "File could not opened",10
len_e equ $ - error

section .bss
buffer resb 512
fd resq 1

section .text
global _start
_start:
mov rax,2
mov rdi,filename
mov rsi,0
syscall

cmp rax,0
jl FileError

mov rdx,[rax]


mov rax,0
mov rdi,[fd]
mov rsi,[buffer]
mov rdx,512
syscall

mov rdx,rax
mov rax,1
mov rdi,1
mov rsi,[buffer]
syscall

mov rax,3
mov rdi,[fd]
syscall
jmp  Exit

FileError:
mov rax,1
mov rdi,1
mov rsi,error
mov rdx,len_e
syscall
jmp Exit

Exit:
mov rax,60
xor rdi,rdi
syscall






