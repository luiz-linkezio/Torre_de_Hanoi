#funcão recursiva para resolução da torre de hanoi no menor número de movimentos possíveis para 3 torres
#argumentos: 
#qtd_discos = indica a quantidade de discos, indicando o tamanho do disco atual que será movimentado (ex: 1 é o menor, 2 é o segundo menor, etc)
#origem: indica a torre onde os discos estão posicionados inicialmente (esquerda)
#destino: indica a torre onde deverá está todos os discos ao final do quebra-cabeça (direita), 
#auxiliar: indica a torre que será usada para auxiliar na movimentação dos discos (meio)
def torre_hanoi(qtd_discos, origem='A', destino='C', auxiliar='B'):
    #condição de parada: move o disco que está no topo da torre de origem para a torre de destino
    if qtd_discos == 1:
        print(f'Mova o disco 1 da torre {origem} para a torre {destino}')

    #caso a quantidade de discos ainda não for igual a 1 (pertencente à origem do movimento)
    else:
        #move os (n-1) da origem para o auxiliar
        torre_hanoi(qtd_discos - 1, origem, auxiliar, destino)

        print(f'Mova o disco {qtd_discos}, da torre {origem} para a torre {destino}')

        #move os (n-1) do auxiliar para o destino
        torre_hanoi(qtd_discos - 1, auxiliar, destino, origem)

#input: quantidade de discos
qtd_discos = int(input('Qual é a quantidade de discos? '))
torre_hanoi(qtd_discos)

#output final
print('Concluído!')