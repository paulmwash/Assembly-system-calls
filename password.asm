section .data

prompt db "Enter 'paul' as your password",10
len_p equ $ - prompt

success db "Success password is correct",10
len_s equ $ - success

fail db "Fail password is not correct",10
len_f  equ $ - fail

section .bss

buffer resb 512

section .text
global _start
_start:

mov rax,1
mov rdi,1
mov rsi,prompt
mov rdx,len_p
syscall

mov rax,0
mov rdi,0
mov rsi,buffer
mov rdx,512
syscall

cmp byte  [buffer],'p'
jne Fail

cmp byte  [buffer+1],'a'
jne Fail

cmp byte  [buffer+2],'u'
jne Fail

cmp byte  [buffer+3],'l'
jne Fail

Success:
mov rax,1
mov rdi,1
mov rsi,success
mov rdx,len_s
syscall
jmp Exit

Fail:
mov rax,1
mov rdi,1
mov rsi,fail
mov rdx,len_f
syscall
jmp Exit

Exit:
mov rax,60
xor rdi,rdi
syscall

