from faker import Faker
from func import Table, valid_number
import random  
import string

titles_orig = ["Metodologia","Configuracion Experimental" ,"Analisis de Complejidad Computacional" ,"Comportamiento Asintotico" ,"Estimaciones de Error" ,"Preliminares Algebraicos" ,"Intuicion Geometrica" ,"Propiedades Combinatorias" ,"Casos Extremos" ,"Simulaciones Numericas" ,"Verificacion Formal" ,"Aplicaciones e Implicaciones" ,"Interpretaciones en Teoria de Grafos" ,"Consideraciones Topologicas" ,"Propiedades Espectrales" ,"Formulaciones Variacionales" ,"Aspectos Probabilisticos" ,"Metodos Algebraicos y Geometricos" ,"Tecnicas de Optimizacion" ,"Experimentos Computacionales" ,"Comparacion con Resultados Clasicos" ,"Conexiones con Analisis Funcional" ,"Perspectiva Categorica" ,"Consideraciones Homologicas" ,"Aspectos Algoritmicos" ,"Extension a Dimensiones Superiores" ,"Marco Generalizado" ,"Casos Especiales y Ejemplos" ,"Herramientas Analiticas" ,"Contexto Historico" ,"Perspectivas Teoricas" ,"Limitaciones y Desafios" ,"Justificacion Rigurosa" ,"Comparacion con Metodos Anteriores" ,"Fundamentos Matematicos" ,"Prueba de Concepto" ,"Analisis de Sensibilidad" ,"Analisis Estadistico" ,"Validacion Experimental"]
titles = []
references = []
citation_counter = 0
bibliography = citas = [("En 2019, Smith y colaboradores propusieron un nuevo enfoque para el analisis de datos en grafos.",  "Smith, J., Doe, A., & Lee, K.: Graph Data Analysis, Springer, 2019"),("Segun el modelo presentado por Johnson et al. (2021), la estabilidad del algoritmo mejora en redes convolucionales profundas.",  "Johnson, R., Patel, S., & Wong, L.: Deep CNN Stability, IEEE Transactions on Neural Networks, 2021"),("La tecnica de optimizacion desarrollada en Brown y Taylor (2020) ha sido aplicada exitosamente en problemas de regresion no lineal.",  "Brown, P. & Taylor, M.: Nonlinear Regression Optimization, Journal of Machine Learning, 2020"),("Recientes estudios han demostrado que el metodo propuesto por Garcia y Fernandez (2023) mejora la eficiencia computacional en un 30%.",  "Garcia, L. & Fernandez, C.: Efficient Computing Methods, ACM Computing Surveys, 2023"),("El uso de transformaciones de Fourier en el analisis de imagenes ha sido ampliamente estudiado (Muller, 2018).",  "Muller, H.: Fourier Transforms in Image Processing, Elsevier, 2018"),("En 2022, Nakamura et al. presentaron un enfoque basado en redes generativas para la sintesis de datos.",  "Nakamura, Y., Chen, B., & O'Connor, D.: Generative Networks for Data Synthesis, NeurIPS, 2022"),("La reciente revision sobre modelos de aprendizaje reforzado (Torres y Kim, 2024) destaca la importancia de la exploracion en entornos dinamicos.",  "Torres, F. & Kim, J.: Reinforcement Learning: A Survey, MIT Press, 2024"),("El algoritmo de clustering espectral introducido en Zhao (2017) ha sido ampliamente utilizado en segmentacion de datos.",  "Zhao, X.: Spectral Clustering Techniques, SIAM Journal on Computing, 2017"),("El concepto de redes neuronales convolucionales fue formalizado en LeCun et al. (1998) y ha revolucionado el campo del aprendizaje profundo.",  "LeCun, Y., Bottou, L., Bengio, Y., & Haffner, P.")]

def init():
    global references, citation_counter, titles
    references = []
    citation_counter = 0
    titles = titles_orig.copy()
    
    return ""

def title_generator():
    global titles, references
    if (not titles):
        return "Aspectos Generales"
    title_idx = random.randint(0, len(titles)-1)
    title = titles.pop(title_idx)
    references.append(title)
    return title

def ref_generator():
    global references
    ref_idx = random.randint(0, len(references)-1)
    ref = references[ref_idx]    
    str_ref = "[" + ref + "]" + "(" + "#" + ref.lower().replace(" ", "-") + ")" 
    return str_ref
    
def citation_generator():
    global bibliography, citation_counter
    cita_idx = random.randint(0, len(bibliography)-1)
    cita_orac, cita_autor = bibliography[cita_idx]
    cita_simb = "[^" + str(citation_counter) + "]"
    citation_counter += 1
    cita_str = cita_orac + cita_simb + "\n" + cita_simb + ":" + cita_autor
    return cita_str
    
    

FUNCTION_LETTERS = set()
VARIABLE_LETTERS = set()

fake = Faker()
tableta = Table(6)

def get_unused_variable() -> str:
    free_letters = set(string.ascii_lowercase).difference(FUNCTION_LETTERS)
    c = random.choice(tuple(free_letters))

    VARIABLE_LETTERS.add(c)
    return c

def get_unused_function() -> str:
    free_letters = set(string.ascii_lowercase).difference(VARIABLE_LETTERS)
    c = random.choice(tuple(free_letters))

    FUNCTION_LETTERS.add(c)
    return c


#? ESQUELETO (TASK 9) ------------------------------------------------------------------------
<start> ::= <new> <paper>

<new> ::= <printable>* := init()

<paper> ::= <h1> <intro> <section>{5} <concl>

<h1> ::= "# "<title> "\n"
<title> ::= <printable>* := title_generator()

<intro> ::= "## " <intro_title> "\n" <sc_text> "\n"
<intro_title> ::= "Introduccion" | "Motivacion" | "Preliminares"

<section> ::= "## " <title> "\n" <sc_text> "\n" <content_1> "\n"

<content_1> ::=  <sc_text> "\n " <table> "\n " <sc_text> "\n" <eq> "\n " <sc_text> "\n " <sub_section> #| <section> | <sc_text> "\n" | <eq> "\n" <sc_text> "\n" <content_1>  "\n" |<eq> "\n" <sc_text> "\n" <sub_section> #<table> "\n" <sc_text> "\n" <content_1> "\n" 
<sub_section> ::= "### " <title> "\n" <sc_text> "\n" #<content_2> "\n"

<content_2> ::= <sub_section> |  <sub_sub_section> | <table> "\n" <sc_text> "\n" <content_2> "\n"|  <sc_text> "\n" | <eq> "\n" <sc_text> "\n" <content_2> "\n"
              

<sub_sub_section> ::= "#### " <title> "\n" <sc_text> "\n" <content_3> "\n"

<content_3> ::= <sub_sub_section> |  <sc_text> "\n" <content_3> "\n"| <table> "\n" <sc_text> "\n" <content_3> "\n"| <sc_text> "\n"  | <eq> "\n" <sc_text> "\n" <content_3> "\n"

<sc_text> ::= <paragraph> | <paragraph_llm> | <special_paragraph>#Oraciones cientificas + con ref, citas y != tipos de textos

<concl> ::= "\n## " <concl_title> "\n" <sc_text>
<concl_title> ::= "Direcciones Futuras" |
    "Conclusion" |
    "Discusion y Problemas Abiertos" |
    "Preguntas Abiertas y Futuras Investigaciones"

#? ESQUELETO (TASK 9) ------------------------------------------------------------------------


#? BASIC_MD (TASK 1) ----------------------------------------------------------------------------
<special_paragraph> ::= <sentence>{2,} <special_sentence> <sentence>{0,}
<special_sentence> ::= <emph_sentence> | <link_sentence> | <ref_sentence> | <citation_sentence>

<emph_sentence> ::= <bold> | <italics>

<italics> ::= <italics_subjects> " " <pred>
<italics_subjects> ::= "El _teorema de Fubini_" | 
    "La _hipotesis de Reimann_" | 
    "El _deadlock_" | 
    "La _performance_" | 
    "La propiedad de _liveness_" | 
    "El _parser_" | 
    "El _bug_" | 
    "El _render_" | 
    "El _firewall_" | 
    "La propiedad de _safety_" | 
    "La propiedad de _security_" | 
    "El _livelock_"

<bold> ::=  
    "A diferencia de la definicion anterior, aqui consideramos el **continuo**" |  
    "En este caso, la **topologia** inducida es Hausdorff" |  
    "El conjunto **compacto** obtenido satisface la condicion requerida" |  
    "Aplicamos el **teorema de Banach** para obtener la solucion" |  
    "Notamos que la **funcion caracteristica** cumple la propiedad deseada" |  
    "El espacio de **Hilbert** considerado es separable" |  
    "Dado un **subespacio vectorial** de dimension finita, podemos..." |  
    "La sucesion es **monotona** y **acotada**, por lo que converge" |  
    "Por la **definicion de integral de Lebesgue**, tenemos que..." |  
    "La demostracion sigue por **induccion matematica**" |  
    "Usamos la **desigualdad de Cauchy-Schwarz** para acotar la norma" |  
    "Este resultado es una consecuencia directa del **Lema de Urysohn**" |  
    "Si el operador es **autoadjunto**, entonces sus valores propios son reales" |  
    "Podemos extender la funcion a un **espacio de Banach** mas general" |  
    "Observamos que la **transformada de Fourier** se anula en el infinito"  


<link_sentence> ::= <link_phrase> <link>
<link> ::= <printable>+ := fake.uri()
<link_phrase> ::= "Mas sobre esto se puede ver en " | "Para mas informacion visitar " | "Para continuar con la lectura " | "Mas material disponible en" | "Para completar el contenido visitar "
#? BASIC_MD (TASK 1) ----------------------------------------------------------------------------


#? LENGUAJE (TASK 2/3) ----------------------------------------------------------------------------
<paragraph> ::= <sentence>{3,} "\n"

<sentence> ::= <svo> ". "| <passive> ". " | <compound> ". " | <complex_sentence> ". "

<svo> ::= <suj> " " <pred>
<pred> ::= <verb> " " <obj> | <verb> " " <obj> " " <cc>
<obj> ::= <sust> | <prepo> " " <sust>

<passive> ::= <suj> " " <pasive_verb> " " <obj> | <suj> " " <pasive_verb> " " <obj> " " <cc>

<compound> ::= <svo> " " <conj> " " <svo_sub> | <passive> " " <conj> " " <pasive_sub>

<complex_sentence> ::= <svo> " " <subord> | <passive> " " <subord>
<subord> ::= "que " <svo_sub> | "que " <pasive_sub>
<svo_sub> ::= <sust> " " <pred>
<pasive_sub> ::= <sust> " " <pasive_verb> " " <obj> | <sust> " " <pasive_verb> " " <obj> " " <cc>

<suj_generator> ::= <printable>* := fake.last_name() #Task 2

<pasive_verb> ::= "fue demostrado" | "fue observado" | "fue analizado" | "fue implementado" | "fue evaluado" | "fue optimizado"
<conj> ::= "y" | "pero" | "aunque" | "porque" | "debido a que"
<suj> ::= "La teoria" | "La implementacion" | "La demostracion" | "El teorema" | "Los autores " <suj_generator> " y " <suj_generator> | "La doctora " <suj_generator> | "Andreas Zeller" | "La premisa" | "Los resultados" | "Lo visto" | "Una idea" | "Nosotros "
<prepo> ::= "de" | "en" | "con" | "por" | "para" | "sobre" | "bajo" | "entre" | "hacia" | "desde" | "hasta" | "durante" | "mediante" | "segun"
<sust> ::= "la latencia" | "la optimizacion" | "el codigo" | "el compilador" | "la gramatica" | "la eficiencia" | "la tesis" | "el paper" | "lo explicado" | "una conclusion"
<cc> ::= "en los ultimos años" | "a traves del tiempo" | "de este modo" | "con esto en consideracion"
<verb> ::= "demostro" | "implemento" | "evaluo" | "optimizo" | "analizo" | "comparo" | "mejoro" | "redujo" | "aumento" | "simulo" | "propuso" | "valido" | "entreno" | "proceso" | "clasifico" | "predijo"
#? LENGUAJE (TASK 2/3) ----------------------------------------------------------------------------


#? TABLAS (TASK 4) ----------------------------------------------------------------------------
<table> ::= <header><row>{2 ,}
<header> ::= <printable>+ := tableta.header()
<row> ::= <printable>+ := tableta.row()
#? TABLAS (TASK 4) ----------------------------------------------------------------------------


#? REFERENCIAS (TASK 6) ---------------------------------------------------------------------------
<ref_sentence> ::= <ref_phrase> <ref> ". "
<ref_phrase> ::= "Recordemos lo visto en la seccion " | "Vimos mas sobre esto en " | "Recordemos lo visto en " | "Podemos repasar lo visto en " | "En concordancia con lo visto en "
<ref> ::=  <printable>* := ref_generator()
#? REFERENCIAS (TASK 6) ----------------------------------------------------------------------------


#? ECUACIONES (TASK 7) ----------------------------------------------------------------------------

<eq> ::= "$$" <eq_element> "$$ \n"
<eq_element> ::= <function> | <variable> | <function> " " <connector> " " <eq_element> | <variable> " " <connector> " " <eq_element>

<function> ::= " " <letter_function> | " " <defined_function> " " <eq_element> | " " <cuantifier> " " <letter_variable> | " " <cuantifier> " " <letter_function>

<letter_function> ::= <letter_function_inner> "(" <eq_element> ")"
<letter_function_inner> ::= <printable>+ := get_unused_function()
<defined_function> ::= "\\sum_{"<index>"}^{"<index_sup>"}" | "\\int_{"<index>"}^{"<index>"}" | "\\oint_{"<index>"}^{"<index>"}" | "\\prod_{"<index>"}^{"<index>"}" | "\\sup_{"<index>"}" | "\\inf_{"<index>"}" | "\\max_{"<index>"}"| "\\min_{"<index>"}" | "\\lim_{ "<letter_variable> " \\rightarrow " <index> " }"
<cuantifier> ::= "\\nabla" | "\\exists" | "\\nexists" | "\\partial" | "\\forall" 
<index> ::= <variable> " = 0" 
<index_sup> ::= <_digit>+ 

<variable> ::= " " <letter_variable> | " " <defined_variable>
<letter_variable> ::= <printable>+ := get_unused_variable()
<defined_variable> ::= "\\infty" | "\\pi" | "\\xi" | "\\kappa" | "\\omega" | "\\gamma"

#All connectors take arguments in both sides.
<connector> ::= "+" | "-" | "*" | "=" | "\\oplus" | "\\otimes" | "\\simeq" | "\\equiv" | "\\neq" | "\\leq" | "\\geq"


#? ECUACIONES (TASK 7) ----------------------------------------------------------------------------


#? CITAS (TASK 8) ----------------------------------------------------------------------------
<citation_sentence> ::= <printable>* := citation_generator()
#? CITAS (TASK 8) ----------------------------------------------------------------------------


#? LLM (TASK 10) ----------------------------------------------------------------------------
<paragraph_llm> ::= <scientific_sentence>{3,} <citation_sentence> "\n "

<scientific_sentence> ::= "El Teorema 1.1 establece la base de nuestro argumento. " |
    "Usando el lema anterior, obtenemos el resultado deseado. " |
    "Con estas ecuaciones, hemos demostrado lo que queriamos. " |
    "Se sigue de la ecuacion que la secuencia esta acotada. " |
    "Por el principio de induccion matematica, la afirmacion se cumple. " |
    "Ahora analizamos el comportamiento asintotico de la funcion. " |
    "La demostracion procede por contradiccion. " |
    "Aplicando la desigualdad de Cauchy-Schwarz, obtenemos lo siguiente. " |
    "Dado que la matriz es definida positiva, todos sus valores propios son positivos. " |
    "Diferenciando ambos lados, obtenemos la relacion deseada. " |
    "Concluimos que el espacio es compacto por el _teorema de Heine-Borel_. " |
    "Utilizando un argumento estandar, extendemos este resultado a todos los casos. " |
    "Para n suficientemente grande, la serie converge absolutamente. " |
    "Un calculo directo muestra que esta expresion se simplifica a esto. " |
    "Por el argumento de compacidad, deducimos la existencia de una solucion. " |
    "Construimos un contraejemplo para demostrar que la afirmacion es falsa. " |
    "Este resultado se sigue inmediatamente del teorema. " |
    "Mediante un calculo rutinario, establecemos la estimacion deseada. " |
    "Usando el teorema de Fubini, intercambiamos el orden de integracion. " |
    "Dado que la funcion es holomorfa, satisface las ecuaciones de Cauchy-Riemann. " |
    "Es facil verificar que esta aplicacion es un homomorfismo. " |
    "Por el teorema espectral, concluimos que el operador es normal. " |
    "Aplicamos el Lema de Zorn para obtener un elemento maximal. " |
    "A partir de la definicion de continuidad, deducimos la cota deseada. " |
    "Por la propiedad universal del producto, existe un unico morfismo. " |
    "Integrando por partes, obtenemos la identidad establecida. " |
    "Combinando estas desigualdades, obtenemos el resultado final. " |
    "Dado que la funcion es convexa, alcanza su minimo en un punto critico. " |
    "Para demostrar la sobreyectividad, construimos una preimagen explicita. " |
    "Por unicidad de los limites, concluimos que la secuencia converge. " |
    "Aplicando la desigualdad triangular, establecemos la cota superior. " |
    "Dado que la serie es alternante y decreciente, converge por el teorema de Leibniz. " |
    "Usando la descomposicion de Jordan, escribimos la matriz en forma canonica. " |
    "Por el teorema de Hahn-Banach, existe un funcional que satisface las condiciones dadas. " |
    "Extendemos este resultado considerando un caso mas general. " |
    "Como corolario inmediato, obtenemos la desigualdad deseada. " |
    "A partir de la definicion de espacio metrico, verificamos la desigualdad triangular. " |
    "Dado que la funcion es uniformemente continua, se extiende continuamente al cierre. " |
    "Un argumento inductivo simple establece la relacion de recurrencia deseada. " |
    "Por compacidad, la secuencia tiene una subsecuencia convergente. " |
    "Para ver esto, notemos que la funcion es diferenciable en todas partes. " |
    "Usando la aproximacion de Stirling, estimamos el crecimiento del factorial. " |
    "La conclusion se sigue del teorema del punto fijo de Banach. "

#? LLM (TASK 10) ----------------------------------------------------------------------------


#? CONSTRAINS (TASK 5) ----------------------------------------------------------------------------
where valid_number(str(<row>))
where len(str(<eq>)) > 40
