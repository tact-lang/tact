struct EmptyStrDefaults {
  a: Int = 0;
  b: Bool = false;
  c: String = "";
}

contract EmptyDefaults {
  e: EmptyStrDefaults;

  init() {
    self.e = EmptyStrDefaults{};
  }
}