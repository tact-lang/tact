struct InnerA {
  a: Int;
}

struct InnerB {
  b: Int;
}

struct Both {
  ia: InnerA;
  ib: InnerB;
}

contract Test {
  field: Both;

  init() {
    self.field = Both{ ia: InnerA{a:1}, ib: InnerB{b:2} };
  }
}
