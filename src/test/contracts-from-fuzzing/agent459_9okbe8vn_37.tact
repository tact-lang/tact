struct OptionalFirst {
  flag: Bool?;
  val: Int;
}

contract OptionalFirstField {
  s: OptionalFirst;

  init() {
    self.s = OptionalFirst{
      flag: null,
      val: 42
    };
  }
}