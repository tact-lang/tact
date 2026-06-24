struct OptionWithEmptyDefaults {
  x: Int?;
  y: String?;
}

contract NullDefaults {
  store: OptionWithEmptyDefaults;

  init() {
    self.store = OptionWithEmptyDefaults{};
  }
}