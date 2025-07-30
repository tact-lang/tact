struct Inner {
  a: Int;
  b: Int?;
}

contract Test {
  data: Inner;

  init() {
    self.data = Inner{ a: 1, b: null };
  }
}