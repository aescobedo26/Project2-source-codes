member(X,[X|_]).
member(X,[Y|Z]):- member(X,Z).

move(X,Y,_):- X=:=2, Y=:=0, write("Success!"), !.
move(X,Y,Z):- X<5, \+member((5,Y),Z), write("Fill 5gal jug"),nl,move(5,Y,[(5,Y)|Z]).
move(X,Y,Z):- Y<3, \+member((X,3),Z), write("Fill 3gal jug"),nl,move(X,3,[(X,3)|Z]).
move(X,Y,Z):- X>0, \+member((0,Y),Z), write("Empty 5gal jug"),nl,move(0,Y,[(0,Y)|Z]).
move(X,Y,Z):- Y>0, \+member((X,0),Z), write("Empty 3gal jug"),nl,move(X,0,[(X,0)|Z]).
move(X,Y,Z):-P is X+Y, P>=5, Y>0, K is 5-X, M is Y-K, \+member((5,M),Z), write("Pour from 3gal jug to 5gal jug"),nl,move(5,M,[(5,M)|Z]).
move(X,Y,Z):-P is X+Y, P>=3, X>0, K is 3-Y, M is X-K, \+member((M,3),Z), write("Pour from 5gal jug to 3gal jug"),nl,move(M,3,[(M,3)|Z]).
move(X,Y,Z):-K is X+Y, K<5, Y>0, \+member((K,0),Z), write("Pour from 3gal jug to 5gal jug"),nl,move(K,0,[(K,0)|Z]).
move(X,Y,Z):-K is X+Y, K<3, X>0, \+member((0,K),Z), write("Pour from 5gal jug to 3gal jug"),nl,move(0,K,[(0,K)|Z]).











