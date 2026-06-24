struct X {
  foo: Int;
}

contract InitAssignNullOpt {
  optX: X?;

  init() {
    self.optX = null;
  }
}