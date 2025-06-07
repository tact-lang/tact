struct Inner {
  n: Int;
}

contract Test {
  item: Inner?;

  init() {
    self.item = Inner{ n: 1 };
  }

  receive() {}
}