% Facts
woman(jharna).
man(jayesh).
healthy(jayesh).
healthy(jharna).
wealthy(jayesh).

% Rules
traveler(X) :- healthy(X), wealthy(X).  % A person is a traveler if they are healthy and wealthy.
can_travel(X) :- traveler(X).          % A person can travel if they are a traveler.

% Goals
% (1) Who can travel?
% ?- can_travel(X).

% (2) Who is healthy and wealthy?
% ?- healthy(X), wealthy(X).
