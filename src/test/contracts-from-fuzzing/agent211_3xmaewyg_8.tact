struct OptionalStruct {
  a: Int;
  b: Bool;
}

contract OptStructAsVar {
  s: OptionalStruct?;

  init() {
    self.s = null;
  }
}
