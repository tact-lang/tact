struct Pair {
  x: Int;
  y: Int;
}

contract ArrayLike {
  p1: Pair;
  p2: Pair;
  p3: Pair;
  p4: Pair;

  init() {
    self.p1 = Pair{ x:1, y:2 };
    self.p2 = Pair{ x:3, y:4 };
    self.p3 = Pair{ x:5, y:6 };
    self.p4 = Pair{ x:7, y:8 };
  }
}
