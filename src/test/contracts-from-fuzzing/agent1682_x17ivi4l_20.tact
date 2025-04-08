struct S {
 a: Int;
}

contract TestContract {
  opt1: S?;
  opt2: S?;

  init() {
    self.opt1 = null;
    self.opt2 = null;
  }
}