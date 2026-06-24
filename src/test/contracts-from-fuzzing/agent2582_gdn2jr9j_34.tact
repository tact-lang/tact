struct WrapOpt {
  inner: Int?;
}

contract Test {
  optStruct: WrapOpt?;

  init() {
    self.optStruct = null;
  }
}
