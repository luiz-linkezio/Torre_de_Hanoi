section .data
    pergunta db 'Digite a quantidade de discos (1 a 99):', 0
    movimento1 db 'Moveu um disco da coluna ', 0
    movimento2 db ' até a coluna ', 0
    concluido db 'Concluído!', 0
    
    newline db 10 ; Valor responsável por pular linhas na tabela ASCII
    
    global colunas
    colunas:
        db 'A'
        db 'B'
        db 'C'

section .bss
    entrada resb 3  ; Buffer para armazenar a entrada do usuário (um ou dois dígitos + newline)
    quant_disc resb 1 ; Armazenamento do número de discos

section .text
    global _start

_start:
    mov ecx, pergunta ; Movendo a string para ecx
    call printar_ecx_0 ; Printando o conteúdo de ecx, se for uma string

    mov ecx, entrada ; Ponteiro para o buffer de entrada
    call ler_3_2 ; Leitura do input do usuário que terá 3 bytes, mas só serão lidos 2
   
    ; Transformar de string pra inteiro
    call convert_string_to_int ; Faz a conversão e armazena em eax
    mov [quant_disc], edx ; Move o valor de eax para a variável que será usada

    mov esi, 0 ; Declarando um valor que será usado na função "towerofhanoi"
    call towerofhanoi ; Função da torre de hanói

    mov ecx, concluido ; Mensagem: Concluído!
    call printar_ecx_0 ; Printar o que está em ecx, desde que a string seja terminado com um 0

    ; Sair do programa
    mov eax, 1          ; Número da chamada de sistema para sair
    xor ebx, ebx        ; Código de retorno 0
    int 0x80            ; Chamar a interrupção do sistema
    
towerofhanoi:
    ; Comparação dos valores de esi, para verificar qual a configuração atual das colunas, cada número de esi corresponde a uma configuração diferente
    cmp esi, 0
    je origem_auxiliar_destino
    cmp esi, 1
    je origem_destino_auxiliar
    cmp esi, 2
    je auxiliar_origem_destino
    cmp esi, 3
    je auxiliar_destino_origem
    cmp esi, 4
    je destino_origem_auxiliar
    cmp esi, 5
    je destino_auxiliar_origem

    ; O envio para a configuração de colunas correspondente
    origem_auxiliar_destino:    
        cmp byte [quant_disc], 1 ; Comparando a quantidade de discos com 1
        je disco_unico_0 ; Caso tenha 1 disco apenas
        jmp mais_discos_0 ; Caso tenha mais de um disco
    origem_destino_auxiliar:
        cmp byte [quant_disc], 1 ; Comparando a quantidade de discos com 1
        je disco_unico_1 ; Caso tenha 1 disco apenas
        jmp mais_discos_1 ; Caso tenha mais de um disco
    auxiliar_origem_destino:
        cmp byte [quant_disc], 1 ; Comparando a quantidade de discos com 1
        je disco_unico_2 ; Caso tenha 1 disco apenas
        jmp mais_discos_2 ; Caso tenha mais de um disco
    auxiliar_destino_origem:
        cmp byte [quant_disc], 1 ; Comparando a quantidade de discos com 1
        je disco_unico_3 ; Caso tenha 1 disco apenas
        jmp mais_discos_3 ; Caso tenha mais de um disco
    destino_origem_auxiliar:
        cmp byte [quant_disc], 1 ; Comparando a quantidade de discos com 1
        je disco_unico_4 ; Caso tenha 1 disco apenas
        jmp mais_discos_4 ; Caso tenha mais de um disco
    destino_auxiliar_origem:
        cmp byte [quant_disc], 1 ; Comparando a quantidade de discos com 1
        je disco_unico_5 ; Caso tenha 1 disco apenas
        jmp mais_discos_5 ; Caso tenha mais de um disco
    
    disco_unico_0: ; Caso tenha 1 disco apenas
        mov ecx, movimento1 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, movimento2 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        add ecx, 2
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, newline ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
        
        jmp fim ; Ir para o final da função
        
    mais_discos_0: ; Caso tenha mais de um disco
        dec byte [quant_disc] ; Decrescimento na quantidade de discos
        
        push word [quant_disc] ; Coloca o valor da quantidade atual de discos na pilha, para a primeira recursão e suas "filhas" não interferirem na próxima
        mov esi, 1 ; Decidindo qual a configuração da próxima recursão, a lógica desta primeira recursão de "mais_discos" é sempre trocar a coluna do meio pela última
        call towerofhanoi ; Recursão
        
        mov ecx, movimento1 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, movimento2 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        add ecx, 2
        call printar_ecx ; Printar o que está em ecx 
        
        mov ecx, newline ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
    
        pop word [quant_disc] ; Obtém o valor guardado na pilha, para que as recursões anteriores não interfiram na recursão abaixo
        mov esi, 2 ; Decidindo qual a configuração da próxima recursão, a lógica desta segunda recursão de "mais_discos" é sempre trocar a coluna do meio pela primeira
        call towerofhanoi ; Recursão
        
        jmp fim ; Ir para o final da função
        
    disco_unico_1: ; Caso tenha 1 disco apenas
        mov ecx, movimento1 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, movimento2 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        inc ecx
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, newline ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
        
        jmp fim ; Ir para o final da função
        
    mais_discos_1: ; Caso tenha mais de um disco
        dec byte [quant_disc] ; Decrescimento na quantidade de discos
        
        push word [quant_disc] ; Coloca o valor da quantidade atual de discos na pilha, para a primeira recursão e suas "filhas" não interferirem na próxima
        mov esi, 0 ; Decidindo qual a configuração da próxima recursão, a lógica desta primeira recursão de "mais_discos" é sempre trocar a coluna do meio pela última
        call towerofhanoi ; Recursão
        
        mov ecx, movimento1 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, movimento2 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        inc ecx
        call printar_ecx ; Printar o que está em ecx 
        
        mov ecx, newline ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
    
        pop word [quant_disc] ; Obtém o valor guardado na pilha, para que as recursões anteriores não interfiram na recursão abaixo
        mov esi, 4 ; Decidindo qual a configuração da próxima recursão, a lógica desta segunda recursão de "mais_discos" é sempre trocar a coluna do meio pela primeira
        call towerofhanoi ; Recursão
        
        jmp fim ; Ir para o final da função
        
    disco_unico_2: ; Caso tenha 1 disco apenas
        mov ecx, movimento1 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        inc ecx
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, movimento2 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        add ecx, 2
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, newline ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
        
        jmp fim ; Ir para o final da função
        
    mais_discos_2: ; Caso tenha mais de um disco
        dec byte [quant_disc] ; Decrescimento na quantidade de discos
        
        push word [quant_disc] ; Coloca o valor da quantidade atual de discos na pilha, para a primeira recursão e suas "filhas" não interferirem na próxima
        mov esi, 3 ; Decidindo qual a configuração da próxima recursão, a lógica desta primeira recursão de "mais_discos" é sempre trocar a coluna do meio pela última
        call towerofhanoi ; Recursão
        
        mov ecx, movimento1 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        inc ecx
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, movimento2 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        add ecx, 2
        call printar_ecx ; Printar o que está em ecx 
        
        mov ecx, newline ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
    
        pop word [quant_disc] ; Obtém o valor guardado na pilha, para que as recursões anteriores não interfiram na recursão abaixo
        mov esi, 0 ; Decidindo qual a configuração da próxima recursão, a lógica desta segunda recursão de "mais_discos" é sempre trocar a coluna do meio pela primeira
        call towerofhanoi ; Recursão
        
        jmp fim ; Ir para o final da função
        
    disco_unico_3: ; Caso tenha 1 disco apenas
        mov ecx, movimento1 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        inc ecx
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, movimento2 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, newline ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
        
        jmp fim ; Ir para o final da função
        
    mais_discos_3: ; Caso tenha mais de um disco
        dec byte [quant_disc] ; Decrescimento na quantidade de discos
        
        push word [quant_disc] ; Coloca o valor da quantidade atual de discos na pilha, para a primeira recursão e suas "filhas" não interferirem na próxima
        mov esi, 2 ; Decidindo qual a configuração da próxima recursão, a lógica desta primeira recursão de "mais_discos" é sempre trocar a coluna do meio pela última
        call towerofhanoi ; Recursão
        
        mov ecx, movimento1 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        inc ecx
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, movimento2 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        call printar_ecx ; Printar o que está em ecx 
        
        mov ecx, newline ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
    
        pop word [quant_disc] ; Obtém o valor guardado na pilha, para que as recursões anteriores não interfiram na recursão abaixo
        mov esi, 5 ; Decidindo qual a configuração da próxima recursão, a lógica desta segunda recursão de "mais_discos" é sempre trocar a coluna do meio pela primeira
        call towerofhanoi ; Recursão
        
        jmp fim ; Ir para o final da função
        
    disco_unico_4: ; Caso tenha 1 disco apenas
        mov ecx, movimento1 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        add ecx, 2
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, movimento2 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        inc ecx
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, newline ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
        
        jmp fim ; Ir para o final da função
        
    mais_discos_4: ; Caso tenha mais de um disco
        dec byte [quant_disc] ; Decrescimento na quantidade de discos
        
        push word [quant_disc] ; Coloca o valor da quantidade atual de discos na pilha, para a primeira recursão e suas "filhas" não interferirem na próxima
        mov esi, 5 ; Decidindo qual a configuração da próxima recursão, a lógica desta primeira recursão de "mais_discos" é sempre trocar a coluna do meio pela última
        call towerofhanoi ; Recursão
        
        mov ecx, movimento1 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        add ecx, 2
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, movimento2 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        inc ecx
        call printar_ecx ; Printar o que está em ecx 
        
        mov ecx, newline ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
    
        pop word [quant_disc] ; Obtém o valor guardado na pilha, para que as recursões anteriores não interfiram na recursão abaixo
        mov esi, 1 ; Decidindo qual a configuração da próxima recursão, a lógica desta segunda recursão de "mais_discos" é sempre trocar a coluna do meio pela primeira
        call towerofhanoi ; Recursão
        
        jmp fim ; Ir para o final da função
        
    disco_unico_5: ; Caso tenha 1 disco apenas
        mov ecx, movimento1 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        add ecx, 2
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, movimento2 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, newline ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
        
        jmp fim ; Ir para o final da função
        
    mais_discos_5: ; Caso tenha mais de um disco
        dec byte [quant_disc] ; Decrescimento na quantidade de discos
        
        push word [quant_disc] ; Coloca o valor da quantidade atual de discos na pilha, para a primeira recursão e suas "filhas" não interferirem na próxima
        mov esi, 4 ; Decidindo qual a configuração da próxima recursão, a lógica desta primeira recursão de "mais_discos" é sempre trocar a coluna do meio pela última
        call towerofhanoi ; Recursão
        
        mov ecx, movimento1 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        add ecx, 2
        call printar_ecx ; Printar o que está em ecx
        
        mov ecx, movimento2 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, colunas ; Armazenar string em ecx
        call printar_ecx ; Printar o que está em ecx 
        
        mov ecx, newline ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
    
        pop word [quant_disc] ; Obtém o valor guardado na pilha, para que as recursões anteriores não interfiram na recursão abaixo
        mov esi, 3 ; Decidindo qual a configuração da próxima recursão, a lógica desta segunda recursão de "mais_discos" é sempre trocar a coluna do meio pela primeira
        call towerofhanoi ; Recursão
        
        jmp fim ; Ir para o final da função
    
    fim: ; Fim da função
        ret ; Retorno

convert_string_to_int:
    mov edx, entrada[0] ; Mover o primeiro caractere para o eax
    sub edx, '0' ; Transformar o caractere em algarismo inteiro
    mov eax, entrada[1] ; Mover o segundo caractere para o ebx
    
    cmp eax, 0x0a ; Comparar o segundo caractere da string, se for newline(0x0a em hexadecimal) então só existe um número, pois newline significa que houve uma quebra de linha, o que seria equivalente ao "ENTER" do usuário
    je um_algarismo ; Se o segundo caractere for newline, pula o tratamento de dezena, pois neste caso não existe dezena
    
    sub eax, '0' ; Transformar o caractere em algrismo inteiro
    imul edx, 10 ; Multiplicando o valor do primeiro caractere em 10, porque é a dezena
    add edx, eax ; Somando a dezena(eax) com a unidade(ebx) e formando um número de 0 a 99
    
    um_algarismo:
    
    ret

printar_ecx: ; Imprimir a string que está em ecx
    mov eax, 4               ; Número da chamada de sistema para imprimir
    mov ebx, 1               ; Descritor de arquivo (stdout)
    mov edx, 1               ; Tamanho do caractere a ser impresso
    int 0x80                 ; Chamar a interrupção do sistema
    ret                      ; Retorno
        
printar_ecx_0:          ; Imprimir caractere por caractere (só deve ser usado se a string terminar com um 0 inteiro)
    printar_loop:
        mov al, ecx[0]           ; Carregar o caractere atual
        cmp al, 0               ; Verificar se é o final da string
        je printar_exit         ; Se for, sair da função
        mov eax, 4               ; Número da chamada de sistema para imprimir
        mov ebx, 1               ; Descritor de arquivo (stdout)
        mov edx, 1               ; Tamanho do caractere a ser impresso
        int 0x80                 ; Chamar a interrupção do sistema
        inc ecx                 ; Mover para o próximo caractere
        jmp printar_loop        ; Repetir o loop

    printar_exit:               ; Saída do loop
        ret                     ; Retorno
        
ler_3_2:             ; Ler a string do usuário que terá 3 bytes, mas só serão lidos 2
    mov eax, 3          ; Número da chamada de sistema para ler
    mov ebx, 0          ; Descritor de arquivo (stdin)
    mov edx, 2          ; Tamanho máximo de entrada
    int 0x80            ; Chamando Kernel 
    ret                 ; Retorno03