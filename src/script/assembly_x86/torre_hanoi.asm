section .data
    ; Strings que poderão ser usadas no código posteriormente
    pergunta db 'Digite a quantidade de discos (1 a 99):', 0
    movimento1 db 'Mova o disco ', 0
    movimento3 db ' da coluna ', 0
    movimento2 db ' até a coluna ', 0
    concluido db 'Concluído!', 0
    entrada_invalida db 'Sua entrada é inválida, digite novamente.', 0
    coluna_origem db 'A', 0
    coluna_auxiliar db 'B', 0
    coluna_destino db 'C', 0
    
    quebra_de_linha db 10 ; Valor responsável por pular linhas na tabela ASCII
    
section .bss
    entrada resb 3  ; Buffer para armazenar a entrada do usuário (um ou dois dígitos + newline(quebra de linha))
    quant_disc resb 1 ; Armazenamento do número de discos
    len_buffer resb 2 ; Buffer para armazenar a comprimento de uma string

section .text
    global _start

_start:
    inicio: ; Início do código, esta marcação é usada para retornar a execução em casos de entradas inválidas
    mov ecx, pergunta ; Movendo a string para ecx
    call printar_ecx_0 ; Printar a string que está em ecx, desde que a string seja terminado com um 0
    
    mov ecx, entrada ; Ponteiro para o buffer de entrada
    call ler_3_2 ; Leitura do input do usuário que terá 3 bytes, mas só serão lidos 2
        
    call avaliar_entrada ; Verificar se a entrada é válida ou inválida. Se for inválida, o usuário terá que inserir uma nova entrada.
       
    ; Transformar de string pra inteiro
    call converter_string_int ; Faz a conversão e armazena em eax
    mov [quant_disc], edx ; Move o valor de eax para a variável que será usada
    
    call torre_de_hanoi ; Função da torre de hanói
    
    mov ecx, concluido ; Move o conteúdo de concluido para ecx
    call printar_ecx_0 ; Printar a string que está em ecx, desde que a string seja terminado com um 0
    
    ; Sair do programa
    mov eax, 1          ; Número da chamada de sistema para sair
    xor ebx, ebx        ; Código de retorno 0
    int 0x80            ; Chamar a interrupção do sistema
    
torre_de_hanoi: ; Algoritmo da Torre de Hanói
    cmp byte [quant_disc], 1 ; Comparando a quantidade de discos com 1
    je disco_unico ; Caso tenha 1 disco apenas
    jmp mais_discos ; Caso tenha mais de um disco
    
    disco_unico: ; Caso tenha 1 disco apenas
        mov ecx, movimento1 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        call printar_n_discos ; Função que exibe a quantidade de discos atual, que também é o disco que está sendo movido, assumindo que o disco 1 é o menor e o número vai crescendo de acordo com o tamanho do disco
        
        mov ecx, movimento3 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, coluna_origem ; Move o valor da coluna origem para ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, movimento2 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, coluna_destino ; Move o valor da destino origem para ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, quebra_de_linha ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
        
        jmp fim ; Ir para o final da função
        
    mais_discos: ; Caso tenha mais de um disco
        dec byte [quant_disc] ; Decrescimento na quantidade de discos
        
        push word [quant_disc] ; Coloca o valor da quantidade atual de discos na pilha, para a primeira recursão e suas "filhas" não interferirem na chamada atual da função

        push word [coluna_origem] ; Coloca o valor de coluna origem na pilha, para as recursões futuras não influenciarem nos valores da chamada atual da função
        push word [coluna_auxiliar] ; Coloca o valor de coluna auxiliar na pilha, para as recursões futuras não influenciarem nos valores da chamada atual da função
        push word [coluna_destino] ; Coloca o valor de coluna destino na pilha, para as recursões futuras não influenciarem nos valores da chamada atual da função
        
        ; Trocando o valor da coluna auxiliar com o valor da coluna de destino
        mov dx, [coluna_auxiliar] ; Armazena o valor da coluna auxiliar no registrador dx
        mov cx, [coluna_destino] ; Armazena o valor da coluna destino no registrador cx
        mov [coluna_destino], dx ; Move o valor de dx(coluna auxiliar) para a coluna destino
        mov [coluna_auxiliar], cx ; Move o valor de cx(coluna destino) para a coluna auxiliar
        
        call torre_de_hanoi ; Recursão
        
        pop word [coluna_destino] ; Obtém o valor de coluna destino na pilha, para as recursões passadas não influenciarem nos valores da chamada atual da função
        pop word [coluna_auxiliar] ; Obtém o valor de coluna auxiliar na pilha, para as recursões passadas não influenciarem nos valores da chamada atual da função
        pop word [coluna_origem] ; Obtém o valor de coluna origem na pilha, para as recursões passadas não influenciarem nos valores da chamada atual da função
        
        pop word [quant_disc] ; Obtém o valor guardado na pilha, para que as recursões anteriores não interfiram na recursão abaixo
        
        mov ecx, movimento1 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        inc byte [quant_disc] ; Aumento da quantidade de discos para o decréscimo anterior não influenciar na exibição do valor do disco que será movido
        call printar_n_discos ; Função que exibe a quantidade de discos atual, que também é o disco que está sendo movido, assumindo que o disco 1 é o menor e o número vai crescendo de acordo com o tamanho do disco
        dec byte [quant_disc] ; Decréscimo para retornar o valor anterior ao acréscimo que foi feito anteriormente
        
        mov ecx, movimento3 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, coluna_origem ; Move o valor da coluna origem para ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, movimento2 ; Armazenar string em ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, coluna_destino ; Move o valor da destino origem para ecx
        call printar_ecx_0 ; Printar o que está em ecx
        
        mov ecx, quebra_de_linha ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
        
        ; Trocando o valor da coluna auxiliar com o valor da coluna de origem
        mov dx, [coluna_auxiliar] ; Armazena o valor da coluna auxiliar no registrador dx
        mov cx, [coluna_origem] ; Armazena o valor da coluna origem no registrador cx
        mov [coluna_origem], dx ; Move o valor de cx(coluna origem) para a coluna auxiliar
        mov [coluna_auxiliar], cx ; Move o valor de cx(coluna auxiliar) para a coluna origem
        call torre_de_hanoi ; Recursão
    
    fim: ; Fim da função
        ret ; Retorno

converter_string_int: ; Conversão de 2 algarismos em formato de string para um número inteiro
    mov edx, entrada[0] ; Mover o primeiro caractere para o eax
    sub edx, '0' ; Transformar o caractere em algarismo inteiro
    mov eax, entrada[1] ; Mover o segundo caractere para o ebx
    
    cmp eax, 0x0a ; Comparar o segundo caractere da string, se for newline(0x0a em hexadecimal) então só existe um número, pois newline significa que houve uma quebra de linha, o que seria equivalente ao "ENTER" do usuário
    je um_algarismo ; Se o segundo caractere for newline, pula o tratamento de dezena, pois neste caso não existe dezena
    
    sub eax, '0' ; Transformar o caractere em algrismo inteiro
    imul edx, 10 ; Multiplicando o valor do primeiro caractere em 10, porque é a dezena
    add edx, eax ; Somando a dezena(eax) com a unidade(ebx) e formando um número de 0 a 99
    
    um_algarismo:
    
    ret ; Retorno

printar_ecx: ; Imprimir a string que está em ecx
    mov eax, 4               ; Número da chamada de sistema para imprimir
    mov ebx, 1               ; Descritor de arquivo (stdout)
    mov edx, 1               ; Tamanho do caractere a ser impresso
    int 0x80                 ; Chamar a interrupção do sistema
    ret                      ; Retorno
        
printar_ecx_0:  ; Imprimir caractere por caractere de uma string(só deve ser usado se a string terminar com um 0 inteiro)
    printar_loop:
        mov al, ecx[0]           ; Carregar o caractere atual
        cmp al, 0               ; Verificar se é o final da string
        je printar_exit         ; Se for, sair da função
        call printar_ecx
        inc ecx                 ; Mover para o próximo caractere
        jmp printar_loop        ; Repetir o loop

    printar_exit:               ; Saída do loop
        ret                     ; Retorno
        
ler_3_2:             ; Ler a string do usuário que terá 3 bytes, mas só serão lidos 2
    mov eax, 3          ; Número da chamada de sistema para ler
    mov ebx, 0          ; Descritor de arquivo (stdin)
    mov edx, 2          ; Tamanho máximo de entrada
    int 0x80            ; Chamando Kernel 
    ret                 ; Retorno
    
avaliar_entrada: ; Verificar se a entrada é um número de até 2 algarismos maior que 0 (ainda em string)
    mov cl, entrada[2] ; Move o terceiro caractere da entrada para o registrador cl
    cmp cl, 0x0a ; Compara este caractere com o valor de newline da tabela ASCII
    
    jle quantidade_caracteres_valida ; Se for menor ou igual, a entrada não tem mais do que 2 algarismos e será considerada válida por enquanto, com o objetivo de verificar se é um caractere "vazio", para prevenir números maiores que 99 (2 algarismos)
    
    jmp invalido ; Caso seja maior, a entrada pode ter mais de 2 algarismos ou algum outro caractere inválido na terceira posição/espaço
    
    quantidade_caracteres_valida: ; Quantidade de caracteres válida
    
    mov al, entrada[0] ; Move o primeiro caractere da entrada para o registrador al
    cmp al, 0x30 ; Compara este caractere com o valor na tabela ASCII do número 0(decimal) em formato de string 
    jl invalido ; Se for menor, então significa que o que o usuário digitou não é um número, a entrada então será considerada inválida
    cmp al, 0x39 ; Compara este caractere com o valor na tabela ASCII do número 9(decimal) em formato de string 
    jg invalido ; Se for maior, então significa que o que o usuário digitou não é um número, a entrada então será considerada inválida
    
    mov dl, entrada[1] ; Move o segundo caractere da entrada para o registrador al
    
    cmp dl, 0x0a ; Comparar este caractere com o valor de newline na tabela ASCII, para verificar se o segundo caractere é um algarismo ou se é um newline, newline esta que é gerada pelo "ENTER" do usuário ao ter digitado apenas um algarismo
    je um_algarismo_validacao ; Se o segundo caractere for newline, então só há um algarismo para analisar e não existe a necessidade de tratar um segundo caractere numérico 
    
    cmp dl, 0x30 ; Compara este caractere com o valor na tabela ASCII do número 0(decimal) em formato de string
    jl invalido ; Se for menor, então significa que o que o usuário digitou não é um número, a entrada então será considerada inválida
    cmp dl, 0x39 ; Compara este caractere com o valor na tabela ASCII do número 9(decimal) em formato de string
    jg invalido ; Se for maior, então significa que o que o usuário digitou não é um número, a entrada então será considerada inválida
    
    um_algarismo_validacao:
    
    jmp valido ; Pula o tratamento de invalidez, porque se a execução chegou nesta linha, então a entrada é válida
    invalido: ; Casos em que a entrada é inválida
        mov ecx, entrada_invalida ; Move o conteúdo da string entrada_invalida para ecx
        call printar_ecx_0 ; Chama a função para printar o conteúdo de ecx, desde que a string seja finalizada com um número inteiro 0
        mov ecx, quebra_de_linha ; Armazenar string em ecx, neste caso é uma quebra de linha
        call printar_ecx ; Printar o que está em ecx
        
        jmp inicio ; Pula para o começo do código, onde o usuário terá que digitar uma nova entrada, já que sua última entrada foi inválida
    
    valido: ; Casos em que a entrada é válida
        ret ; Retorno

converter_int_string: ; Função que converte inteiros para string
    dec edi ; Decrementa o conteúdo do registrador EDI
    xor edx, edx ; zerando o registrador EDX
    mov ecx, 10 ;  Move o valor 10 para o registrador ECX
    div ecx ; Divide o valor contido nos registradores EDX:EAX por 10. O quociente é armazenado em EAX, e o resto em EDX.
    add dl, '0' ; converte o dígito numérico para seu equivalente ASCII
    mov [edi], dl ; Armazena o caractere convertido no endereço de memória apontado por EDI
    test eax, eax ; Testa se o valor em EAX (quociente da divisão) é zero
    jnz converter_int_string ; Se não for zero, pula para a próxima iteração
    ret ; Retorno

printar_n_discos: ; Função que printa a quantidade de discos atual
    movzx eax, byte [quant_disc] ; Move o valor da variável quant_disc para o registrador EAX (8 bits)
    lea edi, [len_buffer + 2] ; Carrega o endereço de memória apontado por EDI, usando um offset de 2

    call converter_int_string

    mov eax, 4 ; Número da chamada de sistema para imprimir
    mov ebx, 1 ; Descritor de arquivo (stdout)
    lea ecx, [edi] ; ECX aponta para o endereço de memória apontado por EDI (Carrega o endereço da string convertida em ECX) 
    lea edx, [len_buffer + 2] ; Carrega o endereço de um buffer no registrador EDX
    sub edx, ecx ; Calcula o comprimento da string subtraindo os endereços
    int 0x80 ; Chamar interrupção do sistema
    ret
