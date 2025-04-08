struct OptionalLast {
  val: Int;
  flag: Bool?;
}

contract OptionalLastField {
  s: OptionalLast;

  init() {
    self.s = OptionalLast{
      val: 42,
      flag: null
    };
  }
}