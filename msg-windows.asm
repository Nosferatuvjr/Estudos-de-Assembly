global Start
extern ExitProcess, GetStdHandle, WriteConsoleA

section .data
msg	db	"Hahaha",0Ah
len equ $-msg
msg2	db	"Hahaha",0Ah
len2 equ $-msg2

section .bss
arg1 resd 1

section .text
Start:
push -11
call GetStdHandle

push eax

push 0
push arg1
push len
push msg
push eax
call WriteConsoleA

call Teste

push 0
call ExitProcess


Teste:
push ebp
mov ebp, esp
mov eax, [ebp+8]
push 0
push arg1
push len2
push msg2
push eax
call WriteConsoleA

pop ebp
ret