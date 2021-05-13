jump(StateBefore, StateAfter, AlgBefore, AlgAfter, StepNumber) :-
	append(PrevElements, [green, brown, empty | NextElements], StateBefore),
	append(PrevElements, [empty, brown, green | NextElements], StateAfter),
	atomic_list_concat(StateAfter, ', ', StateString),
	append(AlgBefore, [StepNumber,'. green frog jumed over brown:\n', StateString, '\n\n'], AlgAfter).

jump(StateBefore, StateAfter, AlgBefore, AlgAfter, StepNumber) :-
    append(PrevElements, [empty, green, brown | NextElements], StateBefore),
    append(PrevElements, [brown, green, empty | NextElements], StateAfter),
	atomic_list_concat(StateAfter, ', ', StateString),
    append(AlgBefore, [StepNumber,'. brown frog frog over green:\n', StateString, '\n\n'], AlgAfter).

jump(StateBefore, StateAfter, AlgBefore, AlgAfter, StepNumber) :-
	append(PrevElements, [green, empty | NextElements], StateBefore),
	append(PrevElements, [empty, green | NextElements], StateAfter),
	atomic_list_concat(StateAfter, ', ', StateString),
    append(AlgBefore, [StepNumber,'. green frog jumped on emptyе place:\n', StateString, '\n\n'], AlgAfter).

jump(StateBefore, StateAfter, AlgBefore, AlgAfter, StepNumber) :-
	append(PrevElements, [empty, brown | NextElements], StateBefore),
	append(PrevElements, [brown, empty | NextElements], StateAfter),
	atomic_list_concat(StateAfter, ', ', StateString),
    append(AlgBefore, [StepNumber,'. brown frog jumped on emptyе place:\n', StateString, '\n\n'], AlgAfter).


start(StartState, EndState) :-
	write('Starting state: '), nl,
	atomic_list_concat(StartState, ', ', String),
    write(String), nl,
		(start(StartState, EndState, [], _, 0);
		write("No result."), fail).

start :-
	StartState = [green, green, green, empty, brown, brown, brown],
	EndState = [brown, brown, brown, empty, green, green, green],
	write('Starting state: '), nl,
	atomic_list_concat(StartState, ', ', String),
    write(String), nl,
		(start(StartState, EndState, [], _, 0);
		write("No result."), fail).

start(State, EndState, Algorithm, _, _) :-
	State = EndState,
	append(Algorithm, ["Got result."], AlgorithmEnd),
	write('Result: '), nl,
	atomic_list_concat(AlgorithmEnd, '', String),
    write(String), nl.

start(State, EndState, AlgBefore, AlgAfter, StepNumberBefore) :-
	StepNumberAfter is StepNumberBefore + 1,
	jump(State, NewState, AlgBefore, AlgAfter, StepNumberAfter),
	start(NewState, EndState, AlgAfter, _, StepNumberAfter).