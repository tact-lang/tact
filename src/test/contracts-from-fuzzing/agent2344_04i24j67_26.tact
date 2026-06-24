struct Inner {
  x: Int;
}

struct Outer {
  a: Inner;
  b: Int;
}

contract NestedOrder {
  dat: Outer;

  init() {
    self.dat = Outer{ a: Inner{ x:1 }, b:2 };
  }
}