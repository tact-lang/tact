struct OptionalsWithDefaults {
  a: Int? = null;
  b: Bool? = null;
  c: String? = null;
}

contract HasOptionalsWithDefaults {
  val: OptionalsWithDefaults;

  init() {
    self.val = OptionalsWithDefaults{};
  }
}