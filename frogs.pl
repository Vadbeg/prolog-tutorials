jump(StateBefore, StateAfter, AlgBefore, AlgAfter, StepNumber) :-
	append(PrevElements, [зелёная, коричневая, пусто | NextElements], StateBefore),
	append(PrevElements, [пусто, коричневая, зелёная | NextElements], StateAfter),
	atomic_list_concat(StateAfter, ', ', StateString),
	append(AlgBefore, [StepNumber,'. Зелёная лягушка перепрыгнула коричневую:\n', StateString, '\n\n'], AlgAfter).

jump(StateBefore, StateAfter, AlgBefore, AlgAfter, StepNumber) :-
    append(PrevElements, [пусто, зелёная, коричневая | NextElements], StateBefore),
    append(PrevElements, [коричневая, зелёная, пусто | NextElements], StateAfter),
	atomic_list_concat(StateAfter, ', ', StateString),
    append(AlgBefore, [StepNumber,'. Коричневая лягушка перепрыгнула зелёную:\n', StateString, '\n\n'], AlgAfter).

jump(StateBefore, StateAfter, AlgBefore, AlgAfter, StepNumber) :-
	append(PrevElements, [зелёная, пусто | NextElements], StateBefore),
	append(PrevElements, [пусто, зелёная | NextElements], StateAfter),
	atomic_list_concat(StateAfter, ', ', StateString),
    append(AlgBefore, [StepNumber,'. Зелёная лягушка прыгнула на пустое место:\n', StateString, '\n\n'], AlgAfter).

jump(StateBefore, StateAfter, AlgBefore, AlgAfter, StepNumber) :-
	append(PrevElements, [пусто, коричневая | NextElements], StateBefore),
	append(PrevElements, [коричневая, пусто | NextElements], StateAfter),
	atomic_list_concat(StateAfter, ', ', StateString),
    append(AlgBefore, [StepNumber,'. Коричневая лягушка прыгнула на пустое место:\n', StateString, '\n\n'], AlgAfter).


start :-
	StartState = [зелёная, зелёная, зелёная, пусто, коричневая, коричневая, коричневая],
	EndState = [коричневая, коричневая, коричневая, пусто, зелёная, зелёная, зелёная],
	write('Начальное состояние: '), nl,
	atomic_list_concat(StartState, ', ', String),
    write(String), nl,
		(start(StartState, EndState, [], _, 0);
		write("Решение не найдено."), fail).

start(State, EndState, Algorithm, _, _) :-
	State = EndState,
	append(Algorithm, ["Результат получен."], AlgorithmEnd),
	write('Решение: '), nl,
	atomic_list_concat(AlgorithmEnd, '', String),
    write(String), nl.

start(State, EndState, AlgBefore, AlgAfter, StepNumberBefore) :-
	StepNumberAfter is StepNumberBefore + 1,
	jump(State, NewState, AlgBefore, AlgAfter, StepNumberAfter),
	start(NewState, EndState, AlgAfter, _, StepNumberAfter).