struct OptionalString {
  val: String?;
}

contract NullableStr {
  s: OptionalString;

  init() {
    self.s = OptionalString{
      val: null
    };
  }
}