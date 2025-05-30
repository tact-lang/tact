struct Inner {
  x: Int;
}

struct Outer {
  s: Inner;
  y: Int;
}

contract DeepNested {
  payload: Outer;

  init() {
    self.payload = Outer{ s: Inner{ x: 5 }, y: 7 };
  }
}
