struct MixDefaults {
  a: Int = 1;
  b: Bool;
  c: String?;
  d: Bool? = null;
}

contract MixedDefaultsTest {
  m: MixDefaults;
  
  init() {
    self.m = MixDefaults{
      b: true,
      c: "hi"
    };
  }
}