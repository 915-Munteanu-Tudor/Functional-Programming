% a)positions(list) of the maximal element in a linear list
maxNumbers(A,B,A):- A>=B.
maxNumbers(A,B,B):- A<B.

maxList([H], H):- !.
maxList([H|T], R):-
    maxList(T, R1),
    maxNumbers(H,R1,R).

%indexOf([Element|_], Element, Index, [Index|_]).
%indexOf([_|Tail], Element, Index , R):-
%  indexOf(Tail, Element, Index1, R), % Check in the tail of the list
%  Index is Index1+1.  % and increment the resulting index

allPos([], _, [], _).
allPos([E|T], E, [I|Is], I) :-
    I1 is I + 1,
    allPos(T, E, Is, I1).
allPos([H|T], E, Is, I) :- dif(H, E),
    I1 is I + 1,
    allPos(T, E, Is, I1).


findAllMaxPos(L, Is):-
    maxList(L,R),
    allPos(L,R,Is,0).

% b)in a heterogeneous list, formed from integers and lists of nrs
% replace all sublists with pos(list) of max elem of that sublist

listProcess([],[]).
listProcess([H|T],[H|R]):- number(H),
    listProcess(T,R).
listProcess([H|T],[R1|R]):- is_list(H),
    findAllMaxPos(H,R1),
    listProcess(T,R).

