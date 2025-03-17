from faker import Faker
import random

fake = Faker()

row_titles = ["Porcentual","Tiempo de ejecucion","Tiempo","Error cuadratico medio","Precision","Recall","F1-Score","Metrica de similitud","Perdida","indice de Silhouette","Numero de clusters","Dimension latente","Varianza explicada","Coeficiente de correlacion","Iteraciones","Frecuencia","Velocidad de convergencia","Tasa de aprendizaje","Entropia","Desviacion estandar","Media","Mediana","Rango intercuartilico","Gradiente","Funcion de activacion","Numero de parametros","Tamano de muestra","Puntaje de clasificacion","Rendimiento","Consumo de memoria","Tiempo de inferencia","Exactitud","Tasa de error","Coeficiente de ajuste"]


class Table:
    def __init__(self, m):
        self.m = m
    def header(self):
        table = ""
        for _ in range(self.m):
            table += "| " + random.choice(row_titles) + " "
        table += "|\n"
        for _ in range(self.m):
            table += "|--"
        table += "|\n"
        
        return table
    
    def row(self):
        table = ""
    
        for _ in range(self.m):
            table += "| " + str(random.randint(10,1000)) + "." +  str(random.randint(1,1100)) + " "
        table += "| \n"
        
        return table


def valid_number(row):
    numeros = row.split("| ")
    numeros.pop(0)
    numeros.pop(-1)
    for numero in numeros:
        if not (10 < float(numero) < 1000):
            return False
    
    return True
