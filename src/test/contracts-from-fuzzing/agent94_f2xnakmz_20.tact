struct InnerA {
  v: Int;
}

struct InnerB {
  v: Bool;
}

struct Container {
  a: InnerA;
  b: InnerB;
  c: Int;
}

contract NestedMix {
  data: Container;

  init() {
    self.data = Container{
      a: InnerA{ v: 1 },
      b: InnerB{ v: true },
      c: 100
    };
  }
}