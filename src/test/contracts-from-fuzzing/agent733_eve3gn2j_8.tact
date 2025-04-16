struct Pair {
  first: Int;
  second: Int;
}

struct Quad {
  p1: Pair;
  p2: Pair;
}

contract TestContract {
  big: Quad = Quad{
    p1: Pair{ first: 1, second: 2 },
    p2: Pair{ first: 3, second: 4 }
  };
  init() {}
}