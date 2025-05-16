struct OptDefault {
  f1: Int? = null;
  f2: Bool? = null;
  f3: String? = null;
}

contract NullDefaults {
  s: OptDefault;

  init() {
    self.s = OptDefault{};
  }
}
