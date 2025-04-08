struct ComboDefaults {
  a: Int = 1;
  b: Int? = null;
  c: Bool = true;
  d: Bool? = null;
}

contract ComboDefaultsStorage {
  s: ComboDefaults;

  init() {
    self.s = ComboDefaults{};
  }
}
