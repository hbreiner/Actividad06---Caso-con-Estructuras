
persona(abraham_simpson, _, _, [homero_simpson, herbert_powell]).
persona(clancy_bouvier, _, _, [marge_simpson, patty_bouvier, selma_bouvier]).
persona(homero_simpson, abraham_simpson, mona_simpson, [bart_simpson, lisa_simpson, maggie_simpson]).
persona(mona_simpson, _, _, [homero_simpson]).
persona(jacqueline_bouvier, _, _, [marge_simpson, patty_bouvier, selma_bouvier]).
persona(marge_simpson, clancy_bouvier, jacqueline_bouvier, [bart_simpson, lisa_simpson, maggie_simpson]).
persona(selma_bouvier, clancy_bouvier, jacqueline_bouvier, [ling_bouvier]).
persona(patty_bouvier, clancy_bouvier, jacqueline_bouvier, []).
persona(bart_simpson, homero_simpson, marge_simpson, []).
persona(lisa_simpson, homero_simpson, marge_simpson, []).
persona(maggie_simpson, homero_simpson, marge_simpson, []).
persona(ling_bouvier, _, selma_bouvier, []).
% Relaciones
padreDe(Padre, Hijo) :- persona(Padre, _, _, Hijos), member(Hijo, Hijos).
madreDe(Madre, Hijo) :- persona(Hijo, _, Madre, _).

abueloDe(Abuelo, Nieto) :- padreDe(Abuelo, Padre), padreDe(Padre, Nieto).
abuelaDe(Abuela, Nieto) :- madreDe(Abuela, Padre), padreDe(Padre, Nieto).

nieto_nietaDe(Nieto, Abuelo) :- abueloDe(Abuelo, Nieto).
nieto_nietaDe(Nieto, Abuela) :- abuelaDe(Abuela, Nieto).

hermano_hermanaDe(Hermano1, Hermano2) :-
    persona(Hermano1, Padre, Madre, _),
    persona(Hermano2, Padre, Madre, _),
    Hermano1 \= Hermano2.

tio_tiaDe(Tio, Sobrino) :-
    hermano_hermanaDe(Tio, Padre),
    padreDe(Padre, Sobrino).

tio_tiaDe(Tia, Sobrino) :-
    hermano_hermanaDe(Tia, Madre),
    madreDe(Madre, Sobrino).

sobrino_sobrinaDe(Sobrino, Tio) :- tio_tiaDe(Tio, Sobrino).

primo_primaDe(Primo1, Primo2) :-
    padreDe(P1, Primo1),
    padreDe(P2, Primo2),
    hermano_hermanaDe(P1, P2).

primo_primaDe(Primo1, Primo2) :-
    madreDe(M1, Primo1),
    madreDe(M2, Primo2),
    hermano_hermanaDe(M1, M2).