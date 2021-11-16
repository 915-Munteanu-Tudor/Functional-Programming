%10. For a list a1... an with integer and distinct numbers, define a predicate to
%determine all subsets with sum of elements divisible with n.

%flow(i,i,o)
sum([], 0).
sum([H|T], S):-
    sum(T, S1),
    S is S1 + H.

%flow(i,o)
subs([],[]).
subs([H|T], [H|R]):-
    subs(T,R).
subs([_|T], R):-
    subs(T,R).

%flow(i,i,o)
onesol(L,N,R1):-
    subs(L,R1),
    sum(R1,S),
    S mod N =:= 0.

%flow(i,i,o)
allsol(L,N,R):-
    findall(RL,onesol(L,N,RL),R).
