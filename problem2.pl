state([left, left, left, left]).
goal([right, right, right, right]).

pass(left, right).
pass(right, left).

%First move is farmer with wolf
move([F, F, G, C], [NF, NF, G, C]) :- pass(F, NF). 
move([F, W, F, C], [NF, W, NF, C]) :- pass(F, NF). 
move([F, W, G, F], [NF, W, G, NF]) :- pass(F, NF). 
move([F, W, G, C], [NF, W, G, C]) :- pass(F, NF). 

safe([F, W, G, C]) :-
    (F = W; F = G), 
    (F = G; F = C). 

solve(Path) :-
    state(Start),
    goal(Goal),
    dfs(Start, Goal, [Start], Path).

dfs(Goal, Goal, Path, Path).
dfs(State, Goal, Visited, Path) :-
    move(State, NextState),
    safe(NextState),
    \+member(NextState, Visited),
    dfs(NextState, Goal, [NextState|Visited], Path).

solution([]).
solution([State|Rest]) :-
    solution(Rest),
    write(State), nl.