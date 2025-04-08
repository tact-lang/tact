struct OptionalWithDefaults {
  a: Int? = null;
  b: String? = null;
  c: Bool? = null;
}

contract Test {
  v: OptionalWithDefaults;
  init() {
    self.v = OptionalWithDefaults{};
  }
}