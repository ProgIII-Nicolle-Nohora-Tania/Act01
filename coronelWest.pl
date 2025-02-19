enemigo_de(coreaDelSur, estadosUnidos).
estadounidense(cWest).
vendio_misiles(cWest, coreaDelSur).

es_criminal(X) :- estadounidense(X), vendio_misiles(X, Y), enemigo_de(Y, 
estadosUnidos).