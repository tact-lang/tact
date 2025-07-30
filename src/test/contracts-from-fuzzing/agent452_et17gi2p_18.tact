struct MixedDefaults {
  a: Int as uint8 = 1;
  b: Int as int16;
  c: Bool = true;
  d: String;
}

contract MixDefSer {
  data: MixedDefaults;

  init() {
    self.data = MixedDefaults{
      b: -100,
      d: "hi",
      // omit a and c, use their defaults
    };
  }
}