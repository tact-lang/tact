struct IntPair {
  x: Int;
  y: Int;
}

struct NestedIntPair {
  a: IntPair;
  b: IntPair;
}

contract PairPairs {
  pairs: NestedIntPair;
  init() {
    self.pairs = NestedIntPair{
      a: IntPair{ x:1, y:2 },
      b: IntPair{ x:3, y:4 }
    };
  }
}