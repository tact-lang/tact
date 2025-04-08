struct Inner {
  x: Int?;
  y: Int?;
}

struct Outer {
  a: Inner;
  b: Inner;
  c: Int;
}

contract TestContract {
  field: Outer;

  init() {
    self.field = Outer {
      a: Inner{ x: 1, y: null },
      b: Inner{ x: null, y: 2 },
      c: 3
    };
  }
}