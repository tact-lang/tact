struct BoolDefaults {
  a: Bool = true;
  b: Bool = false;
}

contract BoolDefaultsTest {
  s: BoolDefaults;

  init() {
    self.s = BoolDefaults{};
  }
}
