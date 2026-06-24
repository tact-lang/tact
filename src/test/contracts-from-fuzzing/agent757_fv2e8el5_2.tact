struct Inner {
  a: Int;
  b: Bool;
}

struct Middle {
  i1: Inner;
  b: Bool;
}

struct Outer {
  m1: Middle;
  m2: Middle;
}

contract NestedStructVars {
  storage: Outer;

  init() {
    self.storage = Outer{
      m1: Middle{ i1: Inner{ a: 1, b: true }, b: false },
      m2: Middle{ i1: Inner{ a: 2, b: false }, b: true }
    };
  }
}