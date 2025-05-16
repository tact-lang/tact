struct Inner {
  foo: Int;
}

contract Test {
  data: Inner;
  init() {
    self.data = Inner{ foo: 5 };
  }
}