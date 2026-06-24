struct SWithDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "hi";
}

contract WithDefaults {
  s: SWithDefaults;
  init() {
    self.s = SWithDefaults{};
  }
}