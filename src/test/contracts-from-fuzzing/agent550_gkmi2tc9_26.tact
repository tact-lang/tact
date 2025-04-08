struct Inner {
  foo: Int;
}

contract Test {
  bar: Inner;
  init() {
    self.bar = Inner{ foo: 123 };
  }
}