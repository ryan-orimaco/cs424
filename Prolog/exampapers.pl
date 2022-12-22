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

%% Autumn 2018
%% Define a Prolog predicate scissor/4 which is true when a list (first arg) is 
%% split into two pieces (3rd and 4th arg) at a given element (third arg).
%% Example: ?- scissors([a,b,c,d,e,f],c,[a,b],[d,e,f]).
%yes
%%Firstly get a list that splits it in half
splitList([],[]).
splitList([H1|T1], [H2|T2]) :-
    H1 = H2, 
    splitList(T1,T2). %%Split the list

scissors([H1|T1],C,[], P2) :-
    (H1 = C),
    splitList(T1,P2).

scissors([H1|T1], C, [H2|T2], P2) :-
    H1 = H2,
    scissors(T1,C,T2,P2).

%% January 2018
%%Define a Prolog predicate mul/3 (+,+,-) which is true when, given
%%three lists, the length of the third is the product of the lengths of the first two.
%%Examples: ?- mul([a,b],[a,b,c],[w,x,y,z,p,d])
%%yes
%%?- mul([a,b],[b,c],Xs)
%%Xs = [_,_,_,_,_,_]
mul(L1,L2,L3) :-
    length(L1,R1),
    length(L2,R2),
    length(L3,R3),
    SUM is R1*R2,
    SUM = R3. 

%% Autumn 2017
%%Define a Prolog predicate thrice/2 which is true when its first argument appears three
%%times in its second argument, which must be a list.
%%Examples: ?- thrice(e,[t,h,e,b,e,a,t,b,e]).
%%yes
%%?- thrice(e,[t,h,e,b,e,a,t,b]).
%%no
thrice(_,_,3) :- !.
thrice(E, [H|T], N) :-
    H = E -> 
        INC is N+1,
        thrice(E,H,INC) ;
    thrice(E,T,N).

%% January 2017
%% Define a Prolog predicate path(X,Y,G), where path(-,-,+), which
%% is true when there is a path from node X to node Y in a directed
%% graph G, where the graph is represented by a list of edges, each
%% represented by a two-element list of the source and destination nodes.
%% Examples:
%% ?- path(b,Y,[[a,b],[b,c],[b,d],[d,e]]).
%% Y = c ;
%% Y = d ;
%% Y = e ;
%% no
%% ?- path(X,b,[[a,b],[b,c],[b,d],[d,e]]).
%% X = a ;
%% no
%% ?- path(c,e,[[a,b],[b,c],[b,d],[d,e]]).
%% yes
path(X,Y, (H|[X,Y])).
path(X,Y, ([X,Y]|T)).
path(X,Y, [H|T]) :- path(X,Y,T).

