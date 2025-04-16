struct NestedDefaults {
  a: Int = 1;
  b: Bool? = true;
}

contract NestedDefaultsContract {
  s: NestedDefaults;

  init() {
    self.s = NestedDefaults{};
  }
}