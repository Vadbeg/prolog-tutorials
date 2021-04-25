sticks_are_equal(X, Y) :-
    X == Y -> 
    write(X), 
    write(' can`t be equal to '),
    write(Y),
    fail;
    X \== Y.

move(1,X,Y,Z) :- 
    sticks_are_equal(X, Y),
    sticks_are_equal(X, Z),
    sticks_are_equal(Y, Z),

    write('Move top disk from '), 
    write(X), 
    write(' to '), 
    write(Y), 
    nl. 

move(N,X,Y,Z) :- 
    N>1, 
    sticks_are_equal(X, Y),
    sticks_are_equal(X, Z),
    sticks_are_equal(Y, Z),
    M is N-1, 
    move(M,X,Z,Y), 
    move(1,X,Y,Z), 
    move(M,Z,Y,X).  
