"""
15.
a)substitute all occurences of an element from a list with another list
"""

def ListLength(lista):
    if lista:
        return ListLength(lista[1:]) + 1
    return 0;

def SubsWithList(lista1, lista2, x, index):

    if ListLength(lista1) == 0:
        return
    elif ListLength(lista2) == 0:
        return
    elif index == ListLength(lista1) :
        return
    elif lista1[index] is not x:
        index+=1
        SubsWithList(lista1,lista2,x,index)
    else:
        lista1[index] = lista2
        SubsWithList(lista1,lista2,x,index)


"""
15.
b)Determine the element from the n-th position in a list.
"""

def ElemOnPosition(lista,pos, index):
    if ListLength(lista) == 0:
        return;
    elif pos < 0:
        return;
    elif index == ListLength(lista):
        return ;
    elif index != pos:
        index+=1
        return ElemOnPosition(lista, pos, index)
    else:
        return lista[index]

def main():
    lista1 = list([5,3,7,21,65,21,46])
    lista2 = list([1,2])

    while True:
        choose = input("\nChoose a,b or c:")
        if choose == "a":
            x =int(input("Give a number: "))
            SubsWithList(lista1, lista2, x, 0)
            print(lista1)
        elif choose == "b":
            pos = int(input("Choose a position:"))
            x = ElemOnPosition(lista1,pos,0)
            print(x)
        elif choose == "c":
            print("Exit the program.")
            return ;
        else:
            print("bad choice!\n")

main()