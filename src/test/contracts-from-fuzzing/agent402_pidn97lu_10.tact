struct OptionalsAndDefaults {
  a: Int? = null;
  b: Bool? = null;
  c: String = "default";
  d: Int = 10;
}

contract OptionalDefaultsTest {
  data: OptionalsAndDefaults;

  init() {
    self.data = OptionalsAndDefaults{};
  }
}