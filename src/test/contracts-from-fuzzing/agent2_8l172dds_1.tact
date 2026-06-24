struct Inner {
  a: Int;
  b: Bool;
}

contract Test {
  inner: Inner;

  init() {
    self.inner = Inner{a: 1, b: true};
  }
}