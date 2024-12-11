male(darsh). 
male(chirag). 
male(keyur). 
male(ankit). 
male(chintan).

female(dishu).
female(chaitali).
female(devyani).
female(hetvi).
female(kinjal).
female(tejal). 

parent(darsh,chintan). 
parent(darsh,dishu). 
parent(chintan,keyur). 
parent(chintan,chaitali).
parent(devyani,chintan). 
parent(devyani,dishu). 
parent(chirag,keyur). 
parent(chirag,chaitali). 
parent(kinjal,keyur). 
parent(kinjal,priyanhi). 
parent(ankit,chirag). 
parent(tejal,chirag).

father_of(X,Y) :- male(Y), parent(X,Y). 
mother_of(X,Y) :- female(Y), parent(X,Y). 

grandfather_of(X,Y) :- male(Y), parent(X,Z), parent(Z,Y). 
grandmother_of(X,Y) :- female(Y), parent(X,Z), parent(Z,Y). 

brother_of(X,Y) :- male(Y), father_of(Y,Z) , father_of(X,Z), X\=Y. 
sister_of(X,Y) :- female(Y), father_of(Y,Z), father_of(X,Z), X\=Y. 

uncle_of(X,Y) :- male(Y), father_of(X,Z), brother_of(Z,Y). 
anut_of(X,Y) :- female(Y), brother_of(Y,Z), father_of(X,Z). 

neice_of(X,Y) :- female(Y), father_of(Y,Z), brother_of(Z,X). 
nephew_of(X,Y) :- male(Y), father_of(Y,Z), brother_of(Z,X).