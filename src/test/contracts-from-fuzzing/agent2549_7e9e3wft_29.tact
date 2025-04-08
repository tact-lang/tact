struct OptionalBool {
  val: Bool?;
}

contract NullableBool {
  s: OptionalBool;

  init() {
    self.s = OptionalBool{
      val: null
    };
  }
}