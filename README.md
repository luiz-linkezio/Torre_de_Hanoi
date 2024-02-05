# <div align= center>Torre de Hanói</div>
<img src="https://res.cloudinary.com/devjoseronaldo/image/upload/v1707135065/Captura_de_tela_2024-02-05_091035_zwobdp.png" alt= banner width=100%>

## 💻 Projeto
Projeto da disciplina ***Organização de Computadores e Sistemas Operacionais***, da graduação em [Sistemas de Informação (SI)](https://portal.cin.ufpe.br/graduacao/sistemas-de-informacao/) do [Centro de Informática (CIN)](https://portal.cin.ufpe.br/) da [Universidade Federal de Pernambuco (UFPE)](https://www.ufpe.br/), cursada em no letivo 2023.2.
<br>

O projeto consiste em fazer uma Torre de Hanói usando recursão em Assembly. A Torre de Hanói consiste em três hastes (pinos verticais) e um número de discos de tamanhos diferentes, empilhados em ordem decrescente de tamanho em uma haste, o objetivo é mover a pilha de discos de uma haste para outra seguindo algumas regras.

<br>

## ⚙️ Como executar?
Para executar o projeto de forma fácil e online, siga as instruções abaixo:

```bash
# 1) Acesse o site
$ https://www.tutorialspoint.com/compile_assembly_online.php

# 2) Copie o código ./src/script/assembly_x86/torre_hanoit.asm e cole no editor de texto do site

# 3) Execute o projeto clicando no botão "Execute" no site

```
<br>

## 📋 Ementa da Disciplina
Estudo de conceitos de arquitetura, da organização de computadores e dos sistemas de gerenciamento de recursos de um sistema de computação.

- Módulo 1:
    - Números binários
    - Portas lógicas
    - Representação de números e caracteres (ASCII)
    - Operações binárias: como os computadores fazem cálculos (ALU)
    - Memória principal e registradores
    - A CPU
    - Instruções da CPU
    - Arquiteturas avançadas: pipeline e superscalar
    - O iníco e a necessidade de programação
    - Surgimento e introdução dos Sistemas Operacionais

- Módulo 2:
    - Gerenciamento de Processos (12/02/2024)
    - Gerenciamento de Entrada e Saída

- Módulo 3:
    - Gerenciamento de Memória (04/03/2024)
    - Gerenciamento de Discos

<br>

## 🔖 Regras e Orientações
Construa um programa em Assembly X86 sobre Windows que resolva o quebra-cabeça clássico conhecido como Torre de Hanoi. A Torre de Hanoi é um jogo que envolve três torres A, B e C, contendo N discos com tamanhos diferentes dispostos em ordem decrescente de tamanho, estando o maior embaixo e o menor no topo da pilha. O objetivo deste jogo é mover todos os discos da Torre A para a Torre C, podendo usar a Torre B como auxiliar, seguindo a única regra essencial: nenhum disco maior pode ser colocado sobre um disco menor.

### Visualização:
No link https://www.mathsisfun.com/games/towerofhanoi.html, você pode jogar ou ver a solução da Torre de Hanoi.

### Especificação:
- Este projeto pode ser feito em dupla.
- A entrega se dará de forma presencial no dia 05/02.
- A solução deve usar um procedimento recursivo.
- O número de discos deve ser inserido pelo usuário e pode ter até dois algarismos, ou seja, seu programa deve ser capaz de ler este número.
- O programa deve ser feito em Assembly X86 usando o compilador Nasm ou Tasm para Windows.

<br>

- NASM
   - Sugestão de compilador online: http://www.tutorialspoint.com/compile_assembly_online.php
    - Info do Assembly NASM: https://mentebinaria.gitbook.io/assembly/
    - Tutorial de Assembly NASM: https://www.tutorialspoint.com/assembly_programming/index.htm
- TASM
    - Como instalar o TASM: https://www.youtube.com/watch?v=PQqLLd7owdQ
    - Site do TASM: https://sourceforge.net/projects/guitasm8086/
    - Exempo de programação TASM: https://www.facom.ufu.br/~gustavo/OC1/Apresentacoes/Assembly.pdf

### Exemplo de saída do programa:
- Algoritmo da Torre de Hanoi com 3 discos
- Mova disco 1 da Torre A para a Torre C
- Mova disco 2 da Torre A para a Torre B
- Mova disco 1 da Torre C para a Torre B
- Mova disco 3 da Torre A para a Torre C
- Mova disco 1 da Torre B para a Torre A
- Mova disco 2 da Torre B para a Torre C
- Mova disco 1 da Torre A para a Torre C
- Concluido!

<br>

## 🧑‍💻 Autores

| [<img src="https://github.com/luiz-linkezio.png" width=115><br><sub>Luiz Henrique</sub><br>](https://github.com/luiz-linkezio) <sub>Desenvolvedor</sub><br> <sub>[Linkedin](https://www.linkedin.com/in/lhbas/)</sub><br> <sub> Portfolio </sub> | [<img src="https://github.com/dev-joseronaldo.png" width=115><br><sub>José Ronaldo</sub><br>](https://github.com/Dev-JoseRonaldo) <sub>Desenvolvedor</sub><br> <sub>[Linkedin](https://www.linkedin.com/in/devjoseronaldo/)</sub><br> <sub>[Portfólio](https://joseronaldo.netlify.app/)</sub> |
| :-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
