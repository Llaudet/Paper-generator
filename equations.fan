from faker import Faker
from random import choice
import string

#Avoids having functions and variables with the same name.
FUNCTION_LETTERS = set()
VARIABLE_LETTERS = set()

def get_unused_variable() -> str:
    free_letters = set(string.ascii_lowercase).difference(FUNCTION_LETTERS)
    c = choice(tuple(free_letters))

    VARIABLE_LETTERS.add(c)
    return c

def get_unused_function() -> str:
    free_letters = set(string.ascii_lowercase).difference(VARIABLE_LETTERS)
    c = choice(tuple(free_letters))

    FUNCTION_LETTERS.add(c)
    return c

<eq> ::= "$$" <eq_element> "$$ \n"
<eq_def> :: =  <function> " " <connector> " " <eq_def> | <variable> " " <connector> " " <eq_def>
<eq_element> ::= <function> | <variable>

<function> ::= " " <letter_function> | " " <defined_function> " " <eq_element> | " " <cuantifier> " " <letter_variable> | " " <cuantifier> " " <letter_function>

<letter_function> ::= <letter_function_inner> "(" <eq_element> ")"
<letter_function_inner> ::= <printable>+ := get_unused_function()
<defined_function> ::= "\\sum_{" <index_inf> "}^{" <index_sup> "}" | "\\int_{"<index>"}^{"<index>"}" | "\\oint_{"<index>"}^{"<index>"}" | "\\prod_{"<index>"}^{"<index>"}" | "\\sup_{"<index>"}" | "\\inf_{"<index>"}" | "\\max_{"<index>"}"| "\\min_{"<index>"}" | "\\lim_{ "<letter_variable> " \\rightarrow " <index> " }"
<cuantifier> ::= "\\nabla" | "\\exists" | "\\nexists" | "\\partial" | "\\forall" 
<index_inf> ::= <eq_element> " = 0 " 
<index_sup> ::= <printable>* := str(random.randint(0,10))

<variable> ::= " " <letter_variable> | " " <defined_variable>
<letter_variable> ::= <printable>+ := get_unused_variable()
<defined_variable> ::= "\\infty" | "\\pi" | "\\xi" | "\\kappa" | "\\omega" | "\\gamma"

#All connectors take arguments in both sides.
<connector> ::= "+" | "-" | "*" | "=" | "\\oplus" | "\\otimes" | "\\simeq" | "\\equiv" | "\\neq" | "\\leq" | "\\geq"

where len(str(<eq>)) > 40