struct OptionalWithDefaults {
  a: Int? = null;
  b: Bool? = true;
  c: String? = "hello";
}

contract OptDefaults {
  data: OptionalWithDefaults;

  init() {
    self.data = OptionalWithDefaults{};
  }
}