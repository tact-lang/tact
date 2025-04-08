struct OptionalsWithDefaults {
  a: Int? = null;
  b: Bool? = null;
  c: String? = null;
  d: Int = 5;
}

contract TestContract {
  data: OptionalsWithDefaults;

  init() {
    self.data = OptionalsWithDefaults{};
  }
}