struct OptionalWithDefaults {
  a: Int? = null;
  s: String? = null;
  b: Bool? = null;
}

contract OptDefaultsTest {
  data: OptionalWithDefaults;

  init() {
    self.data = OptionalWithDefaults{};
  }
}