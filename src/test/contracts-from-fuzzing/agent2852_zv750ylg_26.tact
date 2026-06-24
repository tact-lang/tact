struct Inner {
  a: Int;
  b: Int;
}

struct Outer {
  x: Inner;
  y: Inner;
}

contract TwoStructs {
  s: Outer;

  init() {
    self.s = Outer{
      x: Inner{ a: 1, b: 2 },
      y: Inner{ a: 3, b: 4 }
    };
  }
}