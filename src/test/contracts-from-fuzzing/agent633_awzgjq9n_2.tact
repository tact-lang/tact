struct Inner {
  x: Int;
  y: Bool;
}

contract NestedStructContract {
  data: Inner;

  init() {
    self.data = Inner{ x: 10, y: true };
  }
}
