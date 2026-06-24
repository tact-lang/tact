struct HasDefaults {
  a: Int = 3;
  b: Bool = false;
  s: String = "str";
}

contract InstantiateDefaults {
  d: HasDefaults;
  init() {
    self.d = HasDefaults{};
  }
}