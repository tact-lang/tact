struct MixedDefaults {
  a: Int = 5;
  b: Bool;
  c: String = "z";
}

contract MixedDefaultsStorage {
  data: MixedDefaults;

  init() {
    self.data = MixedDefaults{b: true};
  }
}