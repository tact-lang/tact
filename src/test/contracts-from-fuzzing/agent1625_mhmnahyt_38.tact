struct NestedOptAndDefaults {
  a: Int? = null;
  b: Bool? = null;
}

contract NestedOptDefaulted {
  s: NestedOptAndDefaults;

  init() {
    self.s = NestedOptAndDefaults{};
  }
}
