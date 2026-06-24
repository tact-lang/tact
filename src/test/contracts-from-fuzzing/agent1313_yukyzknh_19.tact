struct StrDefaults {
  s: String = "xyz";
  t: String = "";
}

contract StructWithStringDefaults {
  f: StrDefaults;

  init() {
    self.f = StrDefaults{};
  }
}