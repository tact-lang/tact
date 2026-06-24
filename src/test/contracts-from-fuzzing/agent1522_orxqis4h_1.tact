struct Inner {
  x: Int;
  y: Int?;
}

struct Outer {
  a: Int;
  b: Inner;
  c: Int?;
}

contract NestedTest {
  data: Outer;

  init() {
    self.data = Outer{
      a: 1,
      b: Inner{ x: 2, y: 3 },
      c: null,
    };
  }

  receive() {
    let _ = self.data;
  }
}