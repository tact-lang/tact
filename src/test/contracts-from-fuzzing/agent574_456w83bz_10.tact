// persistent tuple-like structure
struct Pair {
  x: Int;
  y: Int;
}

contract TupleEmulate {
  a: Pair;
  b: Pair;

  init() {
    self.a = Pair{ x: 1, y: 2 };
    self.b = Pair{ x: 3, y: 4 };
  }
}