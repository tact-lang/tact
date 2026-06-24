struct InnerA {
  val: Int;
}

struct InnerB {
  val: Int;
}

struct OuterAB {
  a: InnerA;
  b: InnerB;
}

contract TestTwoNestedStructs {
  vals: OuterAB;
  init() {
    self.vals = OuterAB{
      a: InnerA{val: 1},
      b: InnerB{val: 2}
    };
  }
}