struct OptAndDefaults {
  a: Int?;
  b: Bool = true;
  c: String?;
  d: Bool?;
}

contract MixedInitializer {
  s: OptAndDefaults;

  init() {
    self.s = OptAndDefaults{
      a: null,
      c: null,
      d: null
    };
  }
}