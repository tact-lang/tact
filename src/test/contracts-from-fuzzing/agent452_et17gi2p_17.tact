struct Defaults {
  a: Int = 7;
  b: Bool = false;
}

contract ImplicitDefaults {
  s: Defaults;

  init() {
    self.s = Defaults{};
  }
}