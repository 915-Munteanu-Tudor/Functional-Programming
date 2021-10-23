minNumbers(A,B,A) :- A  =< B.
minNumbers(A,B,B) :- A > B.

minList([H], H) :- !.
minList([H|T], R) :-
    minList(T, R1),
    minNumbers(H, R1, R).

deleteFirstOcc([], _, []) :- !.
deleteFirstOcc([H|T], H, T) :- !.
deleteFirstOcc([H|T], M, [H|R]) :-
    deleteFirstOcc(T, M, R).


deleteFirstMin(L, R) :-
    minList(L, RM),
    deleteFirstOcc(L, RM, R).
