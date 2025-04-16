struct Inner {
  x: Int = 1;
  y: Bool = true;
}

contract Test {
  nested: Inner;

  init() {
    self.nested = Inner{};
  }
}