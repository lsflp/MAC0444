homem(americo).
homem(daniel).
homem(paulo).
homem(carlos).
homem(joaquim).
homem(filipe).
mulher(teresa).
mulher(sonia).
mulher(ana).
mulher(carla).
mulher(barbara).
mulher(maria).
idade(americo, 18).
idade(daniel, 60).
idade(paulo, 25).
idade(carlos, 37).
idade(joaquim, 80).
idade(filipe, 32).
idade(teresa, 18).
idade(sonia, 28).
idade(ana, 17).
idade(carla, 26).
idade(barbara, 51).
idade(maria, 79).
irmaos(americo, paulo).
irmaos(carlos, sonia).
pai(carlos, teresa).
pai(daniel, americo).
pai(daniel, paulo).
pai(joaquim, daniel).
mae(maria, daniel).
mae(barbara, ana).
casados(filipe, carla).
casados(americo, teresa).
casados(joaquim, maria).

% Questão a.
avof(Mul, Pess) :- mae(Mul, X), pai(X, Pess).
avof(Mul, Pess) :- mae(Mul, X), mae(X, Pess).

% Questão b.
avom(Hom, Pess) :- pai(Hom, X), pai(X, Pess).
avom(Hom, Pess) :- pai(Hom, X), mae(X, Pess).

% Questão c.
bisavom(Hom, Pess) :- pai(Hom, X), avom(X, Pess).
bisavom(Hom, Pess) :- pai(Hom, X), avof(X, Pess).

% Questão d.
sao_irmaos(X,Y) :- irmaos(X, Y).
sao_irmaos(X,Y) :- irmaos(Y, X).

primo_1(P1, P2) :- pai(X, P1), pai(Y, P2), sao_irmaos(X, Y).
primo_1(P1, P2) :- pai(X, P1), mae(Y, P2), sao_irmaos(X, Y).
primo_1(P1, P2) :- mae(X, P1), pai(Y, P2), sao_irmaos(X, Y).
primo_1(P1, P2) :- mae(X, P1), mae(Y, P2), sao_irmaos(X, Y).

% Questão e.
primo(P1, P2) :- primo_1(P1,P2).

primo(P1, P2) :- pai(X, P1), pai(Y, P2), primo(X, Y).
primo(P1, P2) :- pai(X, P1), mae(Y, P2), primo(X, Y).
primo(P1, P2) :- mae(X, P1), pai(Y, P2), primo(X, Y).
primo(P1, P2) :- mae(X, P1), mae(Y, P2), primo(X, Y).

% Questão f.
maior_de_idade(Pess) :- idade(Pess, X), X > 17.

% Questão g.
pessoa(X) :- homem(X).
pessoa(X) :- mulher(X).
pessoas(Lista) :- findall(X, pessoa(X), Lista).

% Questão h.
mais_velho(Pess) :- idade(Pess, X), \+ (idade(_, Y), Y > X).

% Questão i.
seleciona_pessoas(Pess, I, Sexo) :- Sexo = m, homem(Pess), idade(Pess, I).
seleciona_pessoas(Pess, I, Sexo) :- Sexo = f, mulher(Pess), idade(Pess, I).
lista_pessoas(Lista, Sexo) :- findall([Pess, I], seleciona_pessoas(Pess, I, Sexo), Lista).

% Questão j.
parentes(Hom, Mul) :- sao_irmaos(Hom, Mul).
parentes(Hom, Mul) :- pai(Hom, Mul).
parentes(Hom, Mul) :- mae(Mul, Hom).
parentes(Hom, Mul) :- avom(Hom, Mul).
parentes(Hom, Mul) :- avof(Mul, Hom).
parentes(Hom, Mul) :- bisavom(Hom, Mul).
parentes(Hom, Mul) :- primo(Hom, Mul).
adequados(Hom, Mul) :- homem(Hom), mulher(Mul), idade(Hom, X), idade(Mul, Y), Y < X+3, X < Y+11, \+ (parentes(Hom, Mul)), \+ (casados(Hom, _)), \+ (casados(_, Mul)).

result([_ , E | L], [E | M]) :- result(L , M).
result(_, []).