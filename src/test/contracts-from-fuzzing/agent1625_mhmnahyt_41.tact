struct MixOptWithDefaults {
  a: Int? = null;
  b: Int = 1;
}

contract MixOptDefault {
  s: MixOptWithDefaults;

  init() {
    self.s = MixOptWithDefaults{};
  }
}
