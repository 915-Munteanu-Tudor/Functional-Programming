evenList([]).
evenList([_, _|T]) :- evenList(T).
