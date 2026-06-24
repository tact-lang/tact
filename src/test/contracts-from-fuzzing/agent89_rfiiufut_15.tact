struct OptionalDefaults {
  x: Int? = null;
  y: Bool? = null;
}

contract OptionalsDef {
  s: OptionalDefaults;

  init() {
    self.s = OptionalDefaults{};
  }
}
