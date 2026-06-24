struct OptStruct {
  val: Int;
}

contract OptionalStruct {
  s: OptStruct?;

  init() {
    self.s = OptStruct{ val: 42 };
  }
}
