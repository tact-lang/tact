struct ManyDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "hi";
}

contract DefaultsAgain {
  f: ManyDefaults;

  init() {
    self.f = ManyDefaults{};
  }
}