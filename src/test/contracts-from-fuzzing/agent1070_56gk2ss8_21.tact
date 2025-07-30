struct SInner {
  a: Int;
}

struct SOuter {
  b: SInner;
}

contract NestedWithDefault {
  s: SOuter = SOuter{ b: SInner{ a: 55 } };

  init() {
    self.s = SOuter{ b: SInner{ a: 100 } };
  }
}