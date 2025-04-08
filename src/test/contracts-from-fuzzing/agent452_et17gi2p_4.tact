struct OptStruct {
  a: Int;
  b: Bool;
}

contract OptHolder {
  s: OptStruct?;

  init() {
    self.s = null;
  }
}