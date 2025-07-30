struct OptionalsAndDefaults {
  ia: Int? = null;
  sa: String? = null;
  ba: Bool? = null;
}

contract DefaultsStructOpt {
  v: OptionalsAndDefaults;
  init() {
    self.v = OptionalsAndDefaults{};
  }
}