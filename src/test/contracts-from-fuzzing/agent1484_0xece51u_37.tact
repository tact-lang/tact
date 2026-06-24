struct OptStrWithDef {
  s: String? = null;
}

contract OptionalStrDefaults {
  f: OptStrWithDef;

  init() {
    self.f = OptStrWithDef{};
  }
}