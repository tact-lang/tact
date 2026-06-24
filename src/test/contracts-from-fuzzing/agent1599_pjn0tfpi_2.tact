struct Inner {
  a: Int;
}

struct Outer {
  x: Inner;
  y: Inner;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      x: Inner{a: 1},
      y: Inner{a: 2},
    };
  }
}