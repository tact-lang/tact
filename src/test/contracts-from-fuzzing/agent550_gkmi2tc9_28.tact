struct Inner {
  foo: Int = 55;
}

contract Test {
  bar: Inner;
  init() {
    self.bar = Inner{};
  }
}