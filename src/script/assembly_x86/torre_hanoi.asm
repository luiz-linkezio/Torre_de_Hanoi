section .bss
    entrada resb 3  ; Buffer para armazenar a entrada do usuário (um ou dois dígitos + newline)

section .text
    global _start

_start:
    mov ecx, entrada ; Ponteiro para o buffer de entrada
    call ler_3_2 ; Leitura do input do usuário que terá 3 bytes, mas só serão lidos 2

ler_3_2:             ; Ler a string do usuário que terá 3 bytes, mas só serão lidos 2
    mov eax, 3          ; Número da chamada de sistema para ler
    mov ebx, 0          ; Descritor de arquivo (stdin)
    mov edx, 2          ; Tamanho máximo de entrada
    int 0x80            ; Chamando Kernel
    ret                 ; Retorno03