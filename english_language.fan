from faker import Faker

fake = Faker()

from random import choice, randrange
#More could be added, such as numbers.
def return_determiner() -> str:
	determiners = ["a", "an", "the", "this", "that", "these", "those", "few", "some", "many", "my", "your",
	"his", "her", "their"]
	return choice(determiners)

def return_determiner_upper() -> str:
	det = return_determiner()
	return det[0].upper() + det[1:len(det)]

def return_preposition() -> str:
	prepositions = [
	    "aboard", "about", "above", "across", "after", "against", "along", "amid", "among", "anti", "around", 
	    "as", "at", "before", "behind", "below", "beneath", "beside", "besides", "between", "beyond", "but", 
	    "by", "concerning", "considering", "despite", "down", "during", "except", "excepting", "excluding", 
	    "following", "for", "from", "in", "inside", "into", "like", "minus", "near", "of", "off", "on", "onto", 
	    "opposite", "outside", "over", "past", "per", "plus", "regarding", "round", "save", "since", "than", 
	    "through", "to", "toward", "towards", "under", "underneath", "unlike", "until", "up", "upon", "versus", 
	    "via", "with", "within", "without"]

	return choice(prepositions)
	
def return_pnoun() -> str:
	return choice([fake.first_name(), fake.last_name(), fake.city(), fake.country(), fake.company()])


def return_pnoun_upper() -> str:
	res = return_pnoun()
	return res[0].upper() + res[1:len(res)]

#Makes word have a random chance of being emphasized.
def choose_emphasis(string: str) -> str:
	emphasis = ["*", "**", "_", "__"]

	if randrange(1, 20) == 15:
		c = choice(emphasis)
		return c + string + c
		
	return string


<start> ::= <paragraph> "\n"

<paragraph> ::= <sentence> "." | <sentence> ". " <paragraph>
<sentence> ::= <noun_phrase_start> " " <verb_phrase>

#This ensures the first word in a sentence is always capitalized. A separate case is used since "noun_phrase" can be called again during the creation of a sentence.
<noun_phrase_start> ::= <determiner_upper> " " <adjective> " " <nominal> | <determiner_upper> " " <nominal>  | <proper_noun_upper>
<noun_phrase> ::= <determiner> " " <adjective> " " <nominal> | <determiner> " " <nominal>  | <proper_noun>
<verb_phrase> ::= <verb_phrase> " " <PP> | <verb> " " <noun_phrase> | <verb> " " <noun_phrase> " " <PP> | <verb>  " " <PP>

<nominal> ::= <noun> | <noun> " " <nominal> | <nominal> " " <PP>
<PP> ::= <preposition> " " <noun_phrase>

<determiner> ::= <printable>+ := choose_emphasis(return_determiner())
<determiner_upper> ::= <printable>+ := choose_emphasis(return_determiner_upper())

<noun> ::= <printable>+ := choose_emphasis(fake.word("noun"))
<verb> ::= <printable>+ := choose_emphasis(fake.word("verb"))

<preposition> ::= <printable>+ := choose_emphasis(return_preposition())

<proper_noun> ::= <printable>+ := choose_emphasis(return_pnoun())
<proper_noun_upper> ::= <printable>+ := choose_emphasis(return_pnoun_upper())

<adjective> ::= <printable>+ := choose_emphasis(fake.word("adjective"))


#The longer sentences get the less sense they make.
# where len(str(<sentence>)) < 90
#Avoid paragraphs that are too long, for aesthetic reasons.
# where 3 <= str(<paragraph>).count(".") and str(<paragraph>).count(".") <= 6
