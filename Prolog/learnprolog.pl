loves(romeo,juliet).
loves(juliet, romeo) :- loves(romeo,juliet).

%%variables who loves romeo?
%% Section 1: Facts
male(albert).
male(bob).
male(bill).
male(carl).
male(charlie).
male(dan).
male(edward).

female(alice).
female(betsy).
female(diana).

%%Variables
parent(albert,bob).
parent(albert,betsy).
parent(albert,bill).

parent(alice,bob).
parent(alice,betsy).
parent(alice,bill).

parent(bob,carl).
parent(bob,charlie).

get_grandchild :- parent(X,carl), parent(X,charlie), format("~w ~s grandparent ~n", [X, "is the"]).

brother(bob,bill).

%%Axioms and Derived facts
grand_parent(X,Y) :-
    parent(Z,X),
    parent(Y,Z).

blushes(X) :- human(X).
human(derek).


%%male(X), female(Y).

%%Section 2: Rules
happy(albert).
happy(alice).
happy(bob).
happy(bill).
with_albert(alice).
runs(albert) :- happy(albert).
dance(alice) :- happy(alice), with_albert(alice).
does_alice_dance :- dance(alice), write("When Alice is happy and with Albert, she Dances").

%%There are no if statements in prolog 
%%Except :- or case
what_grade(5) :-
    write("Go to Kindergarten").
           
what_grade(6) :-
    write("Go to 1st Grade").

what_grade(Other) :-
    Grade is Other - 5,
    format("Go to Grade ~w", [Grade]).

%%Section 3: Complex Terms and Structures
has(albert,olive).
owns(albert,pet(cat,olive)).
get_customer_balance(Fname,Lname) :- customer(Fname,Lname,Bal), write(Fname), tab(1), format("~w owes us %~2f ~n", [Lname,Bal]).

customer(tom,smith, 20.55).
customer(sally,smith, 120.55).

%%You have female(alice).

%%Section 4: Trace - how prolog processes data
warm_blooded(penguin).
warm_blooded(human).
produce_milk(penguin).
produce_milk(human).
have_feathers(penguin).
have_hair(human).
mammal(X) :- warm_blooded(X),
    produce_milk(X),
    have_hair(X).

%%Section 5: Recursion
related(X,Y) :-
    parent(X,Y).

related(X, Y) :- parent(X,Z),
    related(Z,Y).
           


