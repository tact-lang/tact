struct Defaults {
  a: Int = 0;
  b: Bool = false;
}

contract DefaultsFields {
  s: Defaults;

  init() {
    self.s = Defaults{};
  }
}