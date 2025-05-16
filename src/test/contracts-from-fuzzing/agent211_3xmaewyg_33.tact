struct SeveralDefaults {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
  d: Int = 4;
}

contract WithSeveralDefaults {
  s: SeveralDefaults;

  init() {
    self.s = SeveralDefaults{};
  }
}
