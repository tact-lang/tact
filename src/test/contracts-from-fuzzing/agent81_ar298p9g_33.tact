struct Defaults {
  x: Int = 42;
  y: Bool?;
}

contract TestDefaults {
  s: Defaults;

  init() {
    self.s = Defaults{};
  }
}