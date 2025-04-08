struct Inner {
  a: Int?;
}

contract Test {
  optField: Inner?;

  init() {
    self.optField = Inner{a: null};
  }
}