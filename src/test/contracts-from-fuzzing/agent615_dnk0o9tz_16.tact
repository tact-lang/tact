struct OptionalsWithDefaults {
  foo: Int? = null;
  bar: Bool? = true;
}

contract TestContract {
  s: OptionalsWithDefaults;

  init() {
    self.s = OptionalsWithDefaults{};
  }
}