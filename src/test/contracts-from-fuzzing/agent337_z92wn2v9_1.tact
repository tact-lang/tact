struct Inner {
  x: Int;
  y: Bool;
}

contract TestContract {
  pos: Inner;

  init() {
    self.pos = Inner{ x: 5, y: true };
  }
}