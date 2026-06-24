struct Inner {
  a: Int;
  b: Bool;
}

contract Test {
  nested: Inner;

  init() {
    self.nested = Inner{a: 42, b: false};
  }
}
