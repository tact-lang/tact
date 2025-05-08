// optional struct inside optional contract field
struct S {
  f: Int = 42;
}

contract DoubleOpt {
  opt: S?;

  init() {
    self.opt = null;
  }
}
