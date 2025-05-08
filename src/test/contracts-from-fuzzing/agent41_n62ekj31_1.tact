struct Inner {
  a: Int;
}

contract Test {
  field: Inner;

  init() {
    self.field = Inner{a:1};
  }
}