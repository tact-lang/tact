struct Inner {
  x: Int;
  y: Bool = false;
}

contract Test {
  point: Inner;

  init() {
    self.point = Inner{ x: 7, y: true };
  }

  receive() {}
}