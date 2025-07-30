struct Inner {
  x: Int;
}

struct Outer {
  inner: Inner;
  y: Int;
}

contract Test {
  data: Outer;
  init() {
    self.data = Outer{
      inner: Inner{ x: 1 },
      y: 2
    };
  }
}