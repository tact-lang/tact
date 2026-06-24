struct OptionalsDefaults {
  a: Int? = null;
  b: Bool? = true;
  c: Cell? = null;
}

contract OptionDefFields {
  s: OptionalsDefaults;

  init() {
    self.s = OptionalsDefaults{};
  }
}