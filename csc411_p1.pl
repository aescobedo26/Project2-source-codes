%facts
man(i).
man(f).
man(s1).
man(s2).

woman(w).
woman(d).

married(i, w).
married(f, d).

child(d, w).
child(i, f).
child(s1, w).
child(s2, d).

%rules
parent(X,Y) :- child(Y,X).
parent(X,Y) :- married(X,Z), child(Y,Z).

%for_inlaws
parent(X,Y) :- married(Y,Z), child(Z,X).
parent(X,Y) :- soninlaw(X,Y).
soninlaw(X,Y) :- man(X), married(X,Z), parent(Y,Z).

sibling(X,Y) :- parent(Z,X), parent(Z,Y), X\=Y.
uncle(X,Y) :- man(X), sibling(X,Z), parent(Z,Y).

grandfather(X,Y) :- man(X), parent(X,Z), parent(Z,Y).
