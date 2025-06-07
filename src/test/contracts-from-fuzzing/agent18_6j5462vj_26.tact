struct StructA {
  x: Int;
}

struct StructB {
  s: StructA;
  y: Int;
}

contract NestedOrder {
  d: StructB;

  init() {
    self.d = StructB{ s: StructA{ x: 5 }, y: 10 };
  }
}