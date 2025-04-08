struct Inner {
  a: Int;
  b: Bool;
}

contract NestedAgain {
  inner1: Inner;
  inner2: Inner;

  init() {
    self.inner1 = Inner{ a: 5, b: true };
    self.inner2 = Inner{ a: 10, b: false };
  }
}