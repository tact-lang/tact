struct Inner {
  a: Int;
}
struct Middle {
  b: Inner;
}
struct Outer {
  c: Middle;
}

contract Test {
  nested: Outer;

  init() {
    self.nested = Outer{ c: Middle{ b: Inner{ a: 7 } } };
  }
}
