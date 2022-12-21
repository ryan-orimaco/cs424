%%Autumn 2020
%%Define a Prolog predicate betwixt/3(+,-,+) which is true when
%%all three arguments are lists and the second argument is at least as
%%long as the first argument and no longer than the third argument.
%%Example:
%%| ?- betwixt([a,b],X,[c,d,e,f]).
%%X = [_,_] ? ;
%%X = [_,_,_] ? ;
%%X = [_,_,_,_] ? ;
betwixt(L1,L2,L3) :-
    length(L1,R1),
    length(L2,R2),
    length(L3,R3),
    R2 >= R1, 
    R2 =< R3.

%%Jan 2019
%%Define the Prolog predicate runs/1 which is true of lists whose
%%elements each have an identical adjacent element.
%%Examples:
%%?- runs([a,a,b,b,b,c,c,d,d,d,d,e,e]).
%%true.
%%?- runs([a,a,b,b,b,c,X,d,d,d,d,e,e]).
%%X=c
runs([]).
runs([H|[T1|T2]]) :-
    H = T1,
    runs(T2).
