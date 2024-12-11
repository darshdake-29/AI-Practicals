% Facts
on(floor, monkey).
on(floor, box).
in(room, monkey).
in(room, box).
in(room, banana).
at(ceiling, banana).
strong(monkey).
grasp(monkey).
climb(monkey, box).
push(monkey, box) :- strong(monkey).
under(banana, box) :- push(monkey, box).

% Rules
canreach(banana, monkey) :- 
    at(floor, banana);  % If the banana is on the floor, it can be reached
    (at(ceiling, banana), under(banana, box), climb(monkey, box)). % If the banana is on the ceiling, the monkey can push the box under it and climb.

canget(banana, monkey) :- 
    canreach(banana, monkey),  % The monkey can reach the banana
    grasp(monkey).             % The monkey can grasp the banana

% Query Goals
% (1) Can the monkey get the banana?
% ?- canget(banana, monkey).

% (2) Can the monkey reach the banana?
% ?- canreach(banana, monkey).
