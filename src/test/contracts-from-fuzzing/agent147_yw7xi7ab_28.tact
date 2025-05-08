struct ManyDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String = "txt";
}

contract Defs {
  d1: ManyDefaults;
  d2: ManyDefaults;
  init() {
    self.d1 = ManyDefaults{};
    self.d2 = ManyDefaults{};
  }
}