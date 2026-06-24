struct ManyDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "str";
}
contract DefTest {
  v: ManyDefaults = ManyDefaults{};
  init() {
    self.v = ManyDefaults{};
  }
}