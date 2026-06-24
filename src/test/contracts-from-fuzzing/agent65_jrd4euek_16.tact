struct WrappedBool {
  f1: Bool;
  f2: Bool;
  f3: Bool;
}

contract BoolDefaultOpt {
  w: WrappedBool?;
  init() {
    self.w = null;
  }
}