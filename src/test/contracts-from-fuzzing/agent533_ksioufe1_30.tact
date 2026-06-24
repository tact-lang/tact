struct InnerA {
  a: Int;
}

struct InnerB {
  b: Int;
}

struct Container {
  ia: InnerA;
  ib: InnerB;
}

contract DoubleInner {
  x: Container;

  init() {
    self.x = Container{
      ia: InnerA{a:1},
      ib: InnerB{b:2}
    };
  }
}