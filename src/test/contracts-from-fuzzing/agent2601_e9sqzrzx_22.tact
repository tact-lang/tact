struct Inner {
  x: Int;
  y: Int;
}

contract AssignInReceive {
  pair: Inner;

  init() {
    self.pair = Inner{ x: 1, y: 2 };
  }

  receive() {
    self.pair = Inner{ x: 10, y: 20 };
  }
}