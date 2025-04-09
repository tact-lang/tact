struct ManyDefaults {
  a: Int = 3;
  b: Bool = false;
  c: String = "yes";
}

contract DefaultsTest {
  x: ManyDefaults;
  init() {
    self.x = ManyDefaults{};
  }
}