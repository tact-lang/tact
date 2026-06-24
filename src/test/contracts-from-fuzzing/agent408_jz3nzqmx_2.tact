struct Inner {
  x: Int;
  y: Bool;
}

contract TestNested {
  p: Inner;

  init() {
    self.p = Inner{ x: 7, y: true };
  }
}