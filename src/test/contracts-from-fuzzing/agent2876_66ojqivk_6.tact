struct ManyDefaults {
  a: Int = 42;
  b: Bool = true;
  c: String = "hi";
  d: Bool? = null;
  e: String? = null;
}

contract DefaultStructTest {
  s: ManyDefaults;

  init() {
    self.s = ManyDefaults{};
  }
}