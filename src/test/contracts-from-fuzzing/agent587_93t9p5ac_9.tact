struct MixedDefaults {
  a: Int = 1;
  b: Bool = false;
  c: Int?;
  d: Bool?;
  e: Int = 7;
  f: Bool = true;
  g: Int?;
  h: Bool?;
}

contract MixDefaultsContract {
  store: MixedDefaults;

  init() {
    self.store = MixedDefaults{
      c: null,
      d: null,
      g: null,
      h: null
    };
  }
}
