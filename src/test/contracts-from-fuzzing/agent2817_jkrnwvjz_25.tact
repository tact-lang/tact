struct HasDefaults {
  a: Int = 7;
  b: Bool = false;
  c: String = "X";
}

contract StructDefaults {
  f: HasDefaults;

  init() {
    self.f = HasDefaults{};
  }
}
