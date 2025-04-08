struct DeepOptDefaults {
  optInt: Int?;
  optBool: Bool? = null;
  optStr: String? = null;
}

contract OptWithDefaults {
  data: DeepOptDefaults;

  init() {
    self.data = DeepOptDefaults{};
  }
}