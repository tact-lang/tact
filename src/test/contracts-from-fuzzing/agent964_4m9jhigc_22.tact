struct NestedDefaults {
  ai: Int = 33;
  bi: Int = 44;
  s: String = "okay";
}

contract NestedDefaultsTest {
  nested: NestedDefaults;

  init() {
    self.nested = NestedDefaults{};
  }
}
