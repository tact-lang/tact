struct OptionalDefault {
  a: Int? = null;
  b: Bool? = null;
}

contract OptDef {
  val: OptionalDefault;

  init() {
    self.val = OptionalDefault{};
  }
}