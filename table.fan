from faker import Faker
from func import Table, 
# import random


fake = Faker()
tableta = Table(4)


<start> ::= <table>
<table> ::= <header><row>{2 ,}
<header> ::= <printable>* := tableta.header()
<row> ::= <printable>* := tableta.row()

where 