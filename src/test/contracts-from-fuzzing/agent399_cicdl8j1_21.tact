struct OptAndDefaults {
  a: Int? = null;
  b: Bool = false;
  c: String? = null;
}

contract OptDefaultMix {
  s: OptAndDefaults;

  init() {
    self.s = OptAndDefaults{};
  }
}