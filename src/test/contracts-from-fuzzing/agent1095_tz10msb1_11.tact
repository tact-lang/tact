struct NestedDefaults {
  a: Int? = null;
  b: Bool? = null;
  c: Int = 1;
}

contract DefaultsTest {
  s: NestedDefaults;

  init() {
    self.s = NestedDefaults{};
  }
}