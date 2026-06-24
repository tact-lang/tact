struct Defaults {
  a: Int = 11;
  b: Bool = true;
  c: String = "abc";
}

contract WithDefaults {
  f: Defaults;

  init() {
    self.f = Defaults{};
  }
}