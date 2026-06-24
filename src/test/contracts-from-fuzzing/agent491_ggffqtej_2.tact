struct Inner {
  x: Int;
  y: Bool;
}

contract NestedContract {
  point: Inner;

  init() {
    self.point = Inner{ x: 1, y: false };
  }
}
