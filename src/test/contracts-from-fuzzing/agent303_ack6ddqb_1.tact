struct Inner {
  foo: Int;
  bar: Bool;
}

contract Test {
  point: Inner;
  init() {
    self.point = Inner{ foo: 1, bar: true };
  }
}
