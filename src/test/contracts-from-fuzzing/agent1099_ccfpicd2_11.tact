struct Inner {
  x: Int;
  y: Bool;
}

contract Defaulted {
  point: Inner = Inner{ x: 0, y: false };

  init() {
    self.point = Inner{ x: 5, y: true };
  }
}