
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