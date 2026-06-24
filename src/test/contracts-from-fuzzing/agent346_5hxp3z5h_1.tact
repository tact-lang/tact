struct Inner {
  a: Int;
  b: Int?;
}

contract TestContract {
  s: Inner;

  init() {
    self.s = Inner{a: 1, b: null};
  }
}