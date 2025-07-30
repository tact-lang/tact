struct Inner {
  a: Int;
  b: Bool;
}

struct Outer {
  x: Int;
  y: Inner;
}

contract Test {
  info: Outer;

  init() {
    self.info = Outer{
      x: 123,
      y: Inner{a: 5, b: false},
    };
  }
}
