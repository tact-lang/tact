struct S {
  a: Int;
  b: Bool;
}

contract UseOptS {
  param: S?;

  init() {
    self.param = null;
  }
}
