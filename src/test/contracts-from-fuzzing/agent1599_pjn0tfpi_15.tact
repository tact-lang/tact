struct Inner {
  x: Int?;
}

struct Outer {
  y: Inner;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{ y: Inner{ x: null } };
  }
}