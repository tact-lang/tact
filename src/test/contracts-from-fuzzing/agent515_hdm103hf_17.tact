struct S {
  x: Int;
}

contract DeepOpt {
  opt1: S?;
  opt2: S?;
  opt3: S?;

  init() {
    self.opt1 = null;
    self.opt2 = null;
    self.opt3 = S{x:5};
  }
}
