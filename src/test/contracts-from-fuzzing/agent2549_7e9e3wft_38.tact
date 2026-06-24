struct DefaultsEverywhere {
  a: Int = 1;
  b: Bool = true;
  c: String = "x";
}

contract AllDefaults {
  data: DefaultsEverywhere;

  init() {
    self.data = DefaultsEverywhere{};
  }
}