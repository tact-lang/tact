struct OptionalHold {
  val: Int?;
}

contract TestOptionalField {
  f: OptionalHold;

  init() {
    self.f = OptionalHold{
      val: null
    };
  }
}
