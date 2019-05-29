getNotNumber(-1000000).
tree_build([],[]).
tree_build(List, Tree):-
getNodes(List, Nodes), buildTree(Nodes, Tree).

getNodes([],[]).
getNodes([(Key, Value)| Tail], ResultList):-
  getNodes(Tail, TempTail), ResultList = [node(Key, Value, [],[],[],MIN, MIN, Key)|TempTail],
  getNotNumber(MIN).


buildTree([Head|Tail], Tree):- Tail==[], Tree = Head.
buildTree([Head|Tail], Tree):-
  Tail\=[],
  getTree([Head|Tail], C), buildTree(C, Tree).

getTree([],[]).
getTree([Head|Tail],[Head]):-
  Tail == [].
getTree([Head|[Head2|Tail]],[node(MIN,MIN,Head, Head2,[], M1,M2,M2)]):-
  Tail == [],
  getNotNumber(MIN),
  Head = node(_,_,_,_,_,_,_,M1),
  Head2 = node(_,_,_,_,_,_,_,M2).

getTree([Head|[Head2|[Head3| Tail]]],[node(MIN, MIN, Head, Head2, Head3,M1,M2,M3)|TempList]):-
 Head3 \= [], getNotNumber(MIN),
 Head = node(_,_,_,_,_,_,_,M1),
 Head2 = node(_,_,_,_,_,_,_,M2),
 Head3 = node(_,_,_,_,_,_,_,M3),
 getTree(Tail,TempList).

map_size([],0).
map_size(node(Key,_,[],[],[],MIN, MIN, Key), 1):- getNotNumber(MIN).

map_size(node(MIN,MIN,C1,C2,C3,_,_,_), ResultSize)
:-
 getNotNumber(MIN),
 map_size(C1, SizeLeft), map_size(C2, SizeRight),map_size(C3,Size3),
 ResultSize is SizeLeft + SizeRight + Size3.


map_get(node(Key, Value,[],[],[], MIN, MIN, Key), Key, Value):-
getNotNumber(MIN).
map_get(node(_,_,C1,C2,C3,M1,M2,M3 ), Key, Value)
:-(
 Key =< M1->map_get(C1, Key, Value);
 Key =< M2->map_get(C2, Key, Value);
 map_get(C3, Key, Value)
).

