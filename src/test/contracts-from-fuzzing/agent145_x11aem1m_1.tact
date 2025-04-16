struct Inner {
  x: Int;
  y: Int?;
}

contract Test {
  point: Inner;

  init() {
    self.point = Inner { x: 1, y: null };
  }
}