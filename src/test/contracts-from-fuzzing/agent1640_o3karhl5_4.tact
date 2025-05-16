struct OptStruct {
  foo: Int;
  bar: Bool;
}

contract TestOpt {
  sopt: OptStruct?;

  init() {
    self.sopt = null;
  }
}