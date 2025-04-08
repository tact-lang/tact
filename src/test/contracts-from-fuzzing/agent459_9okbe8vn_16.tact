struct MixedDefaults {
  a: Int;
  b: Bool = false;
  c: String?;
}

contract MixedDefaultsTest {
  m: MixedDefaults;

  init() {
    self.m = MixedDefaults{
      a: 7,
      c: null
    };
  }
}