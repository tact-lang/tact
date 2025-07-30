struct ComboDefaults {
  x: Int = 5;
  y: Bool = false;
  z: String? = null;
}

contract ContractDefaults {
  combo: ComboDefaults;

  init() {
    self.combo = ComboDefaults{};
  }
}