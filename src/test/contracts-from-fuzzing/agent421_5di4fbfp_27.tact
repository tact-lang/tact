struct OptWrapper {
  i: Int?;
}

contract WrapOpt {
  w: OptWrapper?;

  init() {
    self.w = null;
  }
}