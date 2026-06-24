struct Inner {
  x: Int = 42;
}

contract Test {
  data: Inner?;

  init() {
    self.data = null;
  }
}