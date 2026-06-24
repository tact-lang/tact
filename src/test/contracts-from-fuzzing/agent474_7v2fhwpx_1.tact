struct Inner {
  a: Int;
  b: Bool;
}

contract Test {
  point: Inner;

  init() {
    self.point = Inner{a: 7, b: true};
  }
}
