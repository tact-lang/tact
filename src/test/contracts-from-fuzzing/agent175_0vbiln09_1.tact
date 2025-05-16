struct Pair {
  first: Int;
  second: Int;
}

contract Test {
  pairField: Pair;

  init() {
    self.pairField = Pair{ first: 1, second: 2 };
  }
}