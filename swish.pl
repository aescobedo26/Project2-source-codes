%all possibilities of moving both cannibals and Missionaries
%LM - Left Missionary, RM- Right Missionary, L2M Left 2 Missionary, R2M, Right 2 missionary
%LC- Left Cannibals , RC-Right cannibals, L2C, Left 2 Cannibals, R2C- right 2 cannibals
cross_river(LM, LC, RM, RC, L2M, LC, R2M, RC) :-
    R2M is RM + 2, L2M is LM - 2, R2M =< 3, L2M >= 0. 

cross_river(LM, LC, RM, RC, LM, L2C, RM, R2C) :-
    R2C is RC + 2, L2C is LC - 2, R2C =< 3, L2C >= 0. 

cross_river(LM, LC, RM, RC, L2M, L2C, R2M, R2C) :-
    R2M is RM + 1, R2C is RC + 1, L2M is LM - 1, L2C is LC - 1, R2M =< 3, L2M >= 0, R2C =< 3, L2C >= 0.

cross_river(LM, LC, RM, RC, L2M, LC, R2M, RC) :-
    R2M is RM + 1, L2M is LM - 1, R2M =< 3, L2M >= 0. 

cross_river(LM, LC, RM, RC, LM, L2C, RM, R2C) :-
    R2C is RC + 1, L2C is LC - 1, R2C =< 3, L2C >= 0. 



move(State, State, Path, Path).
move(CurrentState, GoalState, Visited, Path):-
    action_of_boat(CurrentState, NextState),
    safe_Missionary_and_Cannibal(NextState),
    \+member(NextState, Visited),
    move(NextState, GoalState, [NextState | Visited], Path).


start_state([3,3,0,0,left]).
end_goal([0,0,3,3,right]).

%boat crosing
action_of_boat([LM, LC, RM, RC, left],[L2M, L2C, R2M, R2C, right]):-
    cross_river(LM, LC, RM, RC, L2M, L2C, R2M, R2C).

action_of_boat([LM, LC, RM, RC, right],[L2M, L2C, R2M, R2C, left]):-
    cross_river(RM, RC, LM, LC, R2M, R2C, L2M, L2C).

solve(Path) :-
    start_state(State),
    end_goal(Goal),
    move(State, Goal, [State], Path).

%(Left missionary, right missionary , left cannibal,right cannibal, _ position of boat )
safe_Missionary_and_Cannibal([LM,LC,RM,RC,_]):-
    (LM >= LC ; LM == 0 ),
    (RM >= RC ; RM == 0 ).
         