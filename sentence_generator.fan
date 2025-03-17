from faker import Faker
from func import Table, valid_number
from random import choice

fake = Faker()

<start> ::= <parrafo>


<special_sentencence> ::= <emph_sentence> | <link_sentence> | <ref_sentence> | <citation_sentence>

<emph_word> ::= <bold> | <italics>

<bold_words> ::= ""
<italics_words> ::= "teorema de Fubini" | "hipótesis de Reimann" | "deadlock" | "performance" | "liveness" | "parser" | "bug" | "render" | "firewall" | "safety" | "security" | "livelock"
