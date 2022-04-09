;Nesse arquivo aprendi um pouco sobre como funcionam as interrupções e como usá-las.
;Esse arquivo é um exemplo apenas para linux

section .data
msg db "Isso é uma mensagem de teste",0xA
len equ $-msg

msg2 db "Isso é uma mensagem de teste 2",0xA
len2 equ $-msg2

section .text
global _start

_start:

mv edx, len                                        ;Pega o tamanho da mensagem e armazena em edx
mv ecx, msg                                        ;
mv ebx, 1                                          ;
mv eax, 4                                          ;
int 0x80                                           ;

call _anotherfunction

mv ebx, 0
mv eax, 1
int 0x80                                           ;Segunda interrupção

_anotherfunction:
push ebp
mv ebp, esp

mv edx, len2                                       ;Pega o tamanho da mensagem2 e armazena em edx
mv ecx, msg2
mv evx, 1
mv eax, 4
int 0x80                                           ;Terceira interrupção

pop ebp
ret