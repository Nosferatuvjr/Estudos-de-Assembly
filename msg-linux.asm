;Nesse arquivo aprendi um pouco sobre como funcionam as interrupções e como usá-las.
;Esse arquivo é um exemplo apenas para linux
;Para compilar: #apt install update && apt install upgrade && apt install nasm
;#nasm -f elf32 demo.asm && ld -m elf_i386 demo.o -o demo
;Para executar: #./demo

section .data
msg db "Isso eh uma mensagem de teste",0xA	    ;Pula linha com 0xA
len equ $-msg                                       ;Calcula a posição atual "-" (menos) a posição de msg

msg2 db "Isso eh uma mensagem de teste 2",0xA       ;Pula linha com 0xA
len2 equ $-msg2

section .text
global _start

_start:

mov edx, len                                        ;Pega o tamanho da mensagem e armazena em edx
mov ecx, msg                                        ;Endereço da mensagem
mov ebx, 1                                          ;Saída padrão da chamada
mov eax, 4                                          ;
int 0x80                                            ;Primeira interrupição

call _anotherfunction

mov ebx, 0
mov eax, 1
int 0x80                                           ;Segunda interrupção

_anotherfunction:
push ebp
mov ebp, esp

mov edx, len2                                       ;Pega o tamanho da mensagem2 e armazena em edx
mov ecx, msg2
mov ebx, 1
mov eax, 4
int 0x80                                           ;Terceira interrupção

pop ebp
ret