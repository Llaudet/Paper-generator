from faker import Faker
from func import Table, valid_number
from random import choice
import string

FUNCTION_LETTERS = set()
VARIABLE_LETTERS = set()

fake = Faker()
# tableta = Table(fake.random_number())
tableta = Table(6)

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

<start> ::= <header_text> "\n" <paper>{10}
<paper> ::= <scientific_sentence>{5} "\n" <paper>| <scientific_sentence>{5} "\n $$" <eq_element>{2,} "$$ \n " <paper> | "\n## " <section_name> "\n" <scientific_sentence>{5} <paper> | <scientific_sentence>{5} "\n" <table> "\n" <paper> | <scientific_sentence>{5}"\n"
<posibility_text> ::= <scientific_sentence> | <emphasis_text> | <header_text> | <link_test> 

#? INGLES ----------------------------------------------------------------------------
<scientific_sentence> ::= "Theorem 1.1 establishes the foundation of our argument. " |
    "Using the previous lemma, we obtain the desired result. " |
    "With these equations, we have proved what we wanted. " |
    "It follows from Equation (3.4) that the sequence is bounded. " |
    "By the principle of mathematical induction, the claim holds. " |
    "We now analyze the asymptotic behavior of the function. " |
    "The proof proceeds by contradiction. " |
    "Applying the Cauchy-Schwarz inequality, we obtain ... " |
    "Since the matrix is positive definite, all its eigenvalues are positive. " |
    "Differentiating both sides, we obtain the desired relation. " |
    "We conclude that the space is compact by the Heine-Borel theorem. " |
    "Using a standard argument, we extend this result to all cases. " |
    "A direct computation shows that this expression simplifies to ... " |
    "From the compactness argument, we deduce the existence of a solution. " |
    "We construct a counterexample to demonstrate the claim is false. " |
    "This result follows immediately from Theorem 2.3. " |
    "By a routine calculation, we establish the desired estimate. " |
    "Using Fubini's theorem, we interchange the order of integration. " |
    "Since the function is holomorphic, it satisfies the Cauchy-Riemann equations. " |
    "It is straightforward to verify that this mapping is a homomorphism. " |
    "From the spectral theorem, we conclude that the operator is normal. " |
    "We now apply Zorn's Lemma to obtain a maximal element. " |
    "From the definition of continuity, we deduce the desired bound. " |
    "By the universal property of the product, there exists a unique morphism. " |
    "By integrating by parts, we obtain the stated identity. " |
    "Combining these inequalities, we obtain the final result. " |
    "Since the function is convex, it attains its minimum at a critical point. " |
    "To show surjectivity, we construct an explicit preimage. " |
    "By the uniqueness of limits, we conclude that the sequence converges. " |
    "Applying the triangle inequality, we establish the upper bound. " |
    "Since the series is alternating and decreasing, it converges by Leibniz's theorem. " |
    "Using the Jordan decomposition, we write the matrix in canonical form. " |
    "By the Hahn-Banach theorem, there exists a functional satisfying the given conditions. " |
    "We extend this result by considering a more general case. " |
    "As an immediate corollary, we obtain the desired inequality. " |
    "From the definition of a metric space, we verify the triangle inequality. " |
    "Since the function is uniformly continuous, it extends continuously to the closure. " |
    "A simple induction argument establishes the desired recurrence relation. " |
    "By compactness, the sequence has a convergent subsequence. " |
    "To see this, note that the function is differentiable everywhere. " |
    "Using Stirling's approximation, we estimate the factorial growth rate. " |
    "The conclusion follows from the Banach fixed-point theorem. "

<section_name> ::= "Introduction" | "Motivation" | "Graph Theoretic Interpretations" |
    "Topological Considerations" |
    "Spectral Properties" |
    "Variational Formulations" |
    "Probabilistic Aspects" |
    "Algebraic and Geometric Methods" |
    "Optimization Techniques" |
    "Computational Experiments" |
    "Comparison with Classical Results" |
    "Connections to Functional Analysis" |
    "Categorical Perspective" |
    "Homological Considerations" |
    "Algorithmic Aspects" |
    "Extension to Higher Dimensions" |
    "Generalized Framework" |
    "Special Cases and Examples" |
    "Analytical Tools" |
    "Historical Context" |
    "Theoretical Insights" |
    "Limitations and Challenges" |
    "Rigorous Justification" |
    "Comparison with Previous Methods" |
    "Mathematical Foundations" |
    "Proof of Concept" |
    "Sensitivity Analysis" |
    "Statistical Analysis" |
    "Experimental Validation" |
    "Open Questions and Further Research"

#? INGLES ----------------------------------------------------------------------------


#? ECUACIONES ----------------------------------------------------------------------------
<eq_element> ::= <function> | <variable> | <function> " " <connector> " " <eq_element> | <variable> " " <connector> " " <eq_element>

<function> ::= " " <letter_function> | " " <defined_function> " " <eq_element> | " " <cuantifier> " " <letter_variable> | " " <cuantifier> " " <letter_function>

<letter_function> ::= <letter_function_inner> "(" <eq_element> ")"
<letter_function_inner> ::= <printable>+ := get_unused_function()
<defined_function> ::= "\\sum_{"<index>"}^{"<index>"}" | "\\int_{"<index>"}^{"<index>"}" | "\\oint_{"<index>"}^{"<index>"}" | "\\prod_{"<index>"}^{"<index>"}" | "\\sup_{"<index>"}" | "\\inf_{"<index>"}" | "\\max_{"<index>"}"| "\\min_{"<index>"}" | "\\lim_{ "<letter_variable> " \\rightarrow " <index> " }"
<cuantifier> ::= "\\nabla" | "\\exists" | "\\nexists" | "\\partial" | "\\forall" 
<index> ::= <eq_element>

<variable> ::= " " <letter_variable> | " " <defined_variable>
<letter_variable> ::= <printable>+ := get_unused_variable()
<defined_variable> ::= "\\infty" | "\\pi" | "\\xi" | "\\kappa" | "\\omega" | "\\gamma"

#All connectors take arguments in both sides.
<connector> ::= "+" | "-" | "*" | "=" | "\\oplus" | "\\otimes" | "\\simeq" | "\\equiv" | "\\neq" | "\\leq" | "\\geq"

#? ECUACIONES ----------------------------------------------------------------------------


<header_text> ::= "# " <section_name> 
<emphasis_text> ::= "_" <random_text> "_" | "*" <random_text> "*"
<link_test> ::= "[link] ""("<links>") "

<random_text> ::= <random_sentence> | <random_word> #| <lorem_ipsum>

<random_sentence> ::= <printable>+ := fake.sentence()
<random_word> ::= <printable>+ := fake.word()

<links> ::= <printable>+ := fake.uri()

#? TABLAS ----------------------------------------------------------------------------
<table> ::= <header><row>{2 ,}
<header> ::= <printable>+ := tableta.header()
<row> ::= <printable>+ := tableta.row()
#? TABLAS ----------------------------------------------------------------------------

where valid_number(str(<row>))
where len(str(<start>)) > 40
where len(str(<index>)) <= 10
# import random
# <lorem_ipsum> ::= <printable>+ := fake.lorem_ipsum()
