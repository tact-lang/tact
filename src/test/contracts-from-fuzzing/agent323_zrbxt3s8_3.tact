struct OptionalStruct {
  a: Int?;
  b: Int?;
  c: Int?;
}

contract OptTest {
  opt: OptionalStruct?;

  init() {
    self.opt = null;
  }
}
