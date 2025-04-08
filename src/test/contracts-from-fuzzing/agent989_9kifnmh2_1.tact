struct Inner {
  a: Int;
  b: Bool;
}

contract Test {
  innerField: Inner;

  init() {
    self.innerField = Inner{ a: 1, b: true };
  }
}