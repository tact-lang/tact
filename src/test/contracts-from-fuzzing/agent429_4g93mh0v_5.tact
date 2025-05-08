struct Inner {
  x: Int;
}

struct Outer {
  inner: Inner;
  y: Bool;
}

contract Test {
  val: Outer;
  init() {
    self.val = Outer{ inner: Inner{ x: 7 }, y: true };
  }
}