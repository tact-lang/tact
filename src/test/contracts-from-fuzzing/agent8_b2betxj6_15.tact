struct StructWithDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "foo";
}

contract StructDefaultsTest {
  s: StructWithDefaults;

  init() {
    self.s = StructWithDefaults{};
  }
}