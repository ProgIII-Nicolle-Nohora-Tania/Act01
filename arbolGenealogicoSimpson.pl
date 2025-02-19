padre_de(homero, bart).
padre_de(homero, lisa).
padre_de(homero, maggie).

padre_de(abraham, homero).
padre_de(abraham, herbert).

padre_de(clancy, marge).
padre_de(clancy, patty).
padre_de(clancy, selma).

madre_de(marge, bart).
madre_de(marge, lisa).
madre_de(marge, maggie).

madre_de(jacqueline, marge).
madre_de(jacqueline, patty).
madre_de(jacqueline, selma).

madre_de(selma, ling).

madre_de(mona, homero).

es_hombre(homero).
es_hombre(bart).
es_hombre(herbert).
es_hombre(abraham).
es_hombre(clancy).

es_mujer(marge).
es_mujer(lisa).
es_mujer(maggie).
es_mujer(patty).
es_mujer(selma).
es_mujer(jacqueline).
es_mujer(mona).
es_mujer(ling).

abuelo_de(X, Y) :- padre_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).
abuela_de(X, Y) :- madre_de(X, Z), (padre_de(Z, Y) ; madre_de(Z, Y)).

hermano_de(X, Y) :- (((padre_de(Z, X), padre_de(Z, Y)), \+ (madre_de(W, X), madre_de(W, Y)));
                    ((madre_de(W, X), madre_de(W, Y)), \+ (padre_de(Z, X), padre_de(Z, Y)));
                    ((padre_de(Z, X), padre_de(Z, Y)), (madre_de(W, X), madre_de(W, Y)))), X\=Y, es_hombre(X).

hermana_de(X, Y) :- (((padre_de(Z, X), padre_de(Z, Y)), \+ (madre_de(W, X), madre_de(W, Y)));
                    ((madre_de(W, X), madre_de(W, Y)), \+ (padre_de(Z, X), padre_de(Z, Y)));
                    ((padre_de(Z, X), padre_de(Z, Y)), (madre_de(W, X), madre_de(W, Y)))), X\=Y, es_mujer(X).

tio_de(X,Y) :- hermano_de(X,Z), (padre_de(Z,Y) ; madre_de(Z,Y)), es_hombre(X).
tia_de(X,Y) :- hermana_de(X,Z), (padre_de(Z,Y) ; madre_de(Z,Y)), es_mujer(X).

primo_de(X,Y) :- (tio_de(Z,Y), padre_de(Z,X)) ; (madre_de(W,X), tia_de(W,Y)), es_hombre(X).
prima_de(X,Y) :- (tio_de(Z,Y), padre_de(Z,X)) ; (madre_de(W,X), tia_de(W,Y)), es_mujer(X).