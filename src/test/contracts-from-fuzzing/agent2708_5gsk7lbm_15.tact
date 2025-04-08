struct OptionalStructDefault {
  field1: Int? = null;
  field2: Bool? = null;
}

contract OptStructDef {
  s: OptionalStructDefault;

  init() {
    self.s = OptionalStructDefault{};
  }
}