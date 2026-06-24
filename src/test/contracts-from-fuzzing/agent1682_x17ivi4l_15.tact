struct S {
  x: Int;
}

contract TestContract {
  opt: S?;

  init() {
    self.opt = null;
  }
}