struct InnerTuple {
  a: Int;
  b: Int;
}

struct OuterTuple {
  x: Int;
  pair: InnerTuple;
}

contract TupleNest {
  outer: OuterTuple;

  init() {
    self.outer = OuterTuple{ x: 5, pair: InnerTuple{ a: 11, b: 22 } };
  }
}