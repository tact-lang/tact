struct WrapOpt {
  inner: Int?;
}

contract Test {
  wrap: WrapOpt?;

  init() {
    self.wrap = null;
  }
}