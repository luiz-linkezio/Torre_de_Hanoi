# Funcão recursiva para resolução da torre de hanoi no menor número de movimentos possíveis utilizando 3 colunas, com o uso de listas para representar as colunas.

# Argumentos: 
# qtd_discos = indica a quantidade de discos totais da torre de hanói, e também indica o tamanho do disco atual que será movimentado, sendo 1 o menor tamanho, e {qtd_discos} o maior tamanho
# origem: indica a coluna que terá seu disco removido na movimentação atual
# destino: indica a coluna que receberá um novo disco na movimentação atual
# auxiliar: indica a coluna auxiliar que será intercambiada com outra coluna durante algumas recursões
# coluna1: coluna de origem inicial, será considerada a origem original ao final do algoritmo
# coluna2: coluna auxiliar inicial, será onsiderada a auxiliar original ao final do algoritmo
# coluna3: coluna de destino inicial, será considerada o destino original ao final do algoritmo

def torre_hanoi(n, origem, destino, auxiliar):
    # Se não houver mais discos acima do disco atual, então ele irá ser movido.
    if n == 1:
        print(f"Mova o disco {origem[-1]} de {origem[0]}:{origem[1:]} para {destino[0]}:{destino[1:]}")

        destino.append(origem.pop())

        # Print de todas as colunas no final do código
        if (len(origem) == 1) and (len(auxiliar) == 1):
            print(f"origem: {origem[1:]}")
            print(f"auxiliar: {auxiliar[1:]}")
            print(f"destino: {destino[1:]}")
    else:
        # Movendo n-1 discos da origem para o auxiliar usando o destino como coluna auxiliar
        torre_hanoi(n-1, origem, auxiliar, destino)
        
        # Movendo o disco restante da origem para o destino
        print(f"Mova o disco {origem[-1]} de {origem[0]}:{origem[1:]} para {destino[0]}:{destino[1:]}")

        destino.append(origem.pop())
        # Movendo n-1 discos do auxiliar para o destino usando a origem como coluna auxiliar
        torre_hanoi(n-1, auxiliar, destino, origem)

# Solicitando ao usuário a quantidade de discos
quant_discos = int(input("Digite a quantidade de discos: "))

# Inicializando as colunas, as strings são para indicar qual é a atribuição original de origem, auxiliar e destino
coluna1 = ['origem'] + list(range(quant_discos, 0, -1)) # A coluna 1 já começa com os discos nela, já que ela vai ser responsável pela origem dos discos inicialmente
coluna2 = ['auxiliar']
coluna3 = ['destino']

# Chamando a função para resolver a Torre de Hanói
torre_hanoi(quant_discos, coluna1, coluna3, coluna2)