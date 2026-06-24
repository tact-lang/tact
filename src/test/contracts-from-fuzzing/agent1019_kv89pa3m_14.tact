struct Pair {
  key: Int;
  value: String;
}

contract PairArray {
  p1: Pair;
  p2: Pair;
  p3: Pair;

  init() {
    self.p1 = Pair{ key: 1, value: "A" };
    self.p2 = Pair{ key: 2, value: "B" };
    self.p3 = Pair{ key: 3, value: "C" };
  }
}
