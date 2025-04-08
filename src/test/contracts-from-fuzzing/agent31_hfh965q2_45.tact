struct Pair {
  a: Int;
  b: Int;
}

contract Container {
  p1: Pair;
  p2: Pair;

  init() {
    self.p1 = Pair{a:1,b:2};
    self.p2 = Pair{a:3,b:4};
  }
}