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
primo_1(P1, P2) :- pai(X, P1), pai(Y, P2), irmaos(X, Y).
primo_1(P1, P2) :- pai(X, P1), mae(Y, P2), irmaos(X, Y).
primo_1(P1, P2) :- mae(X, P1), pai(Y, P2), irmaos(X, Y).
primo_1(P1, P2) :- mae(X, P1), mae(Y, P2), irmaos(X, Y).

primo_1(P1, P2) :- pai(X, P1), pai(Y, P2), irmaos(Y, X).
primo_1(P1, P2) :- pai(X, P1), mae(Y, P2), irmaos(Y, X).
primo_1(P1, P2) :- mae(X, P1), pai(Y, P2), irmaos(Y, X).
primo_1(P1, P2) :- mae(X, P1), mae(Y, P2), irmaos(Y, X).

% Questão e.
primo(P1, P2) :- primo_1(P1,P2).

primo(P1, P2) :- avom(X, P1), avom(Y, P2), irmaos(X, Y).
primo(P1, P2) :- avom(X, P1), avof(Y, P2), irmaos(X, Y).
primo(P1, P2) :- avof(X, P1), avom(Y, P2), irmaos(X, Y).
primo(P1, P2) :- avof(X, P1), avof(Y, P2), irmaos(X, Y).

primo(P1, P2) :- avom(X, P1), avom(Y, P2), irmaos(Y, X).
primo(P1, P2) :- avom(X, P1), avof(Y, P2), irmaos(Y, X).
primo(P1, P2) :- avof(X, P1), avom(Y, P2), irmaos(Y, X).
primo(P1, P2) :- avof(X, P1), avof(Y, P2), irmaos(Y, X).

% Questão f.
maior_de_idade(Pess) :- idade(Pess, X), X > 17.

% Questão g. 
pessoas(Lista) :- 