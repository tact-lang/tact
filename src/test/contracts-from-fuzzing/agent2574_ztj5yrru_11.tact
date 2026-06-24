struct InnerA {
  a: Int;
  b: Bool;
}

struct InnerB {
  c: String;
  d: Cell;
}

struct OuterAB {
  s1: InnerA;
  s2: InnerB;
}

contract NestedMix {
  z: OuterAB;

  init() {
    self.z = OuterAB{
      s1: InnerA{ a: 1, b: true },
      s2: InnerB{ c: "yo", d: emptyCell() }
    };
  }
}