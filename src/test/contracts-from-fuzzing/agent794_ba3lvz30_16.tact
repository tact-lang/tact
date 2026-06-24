struct Mixed {
  a: Int?;
  b: Int as uint8;
  c: Bool = true;
  d: Int as int64;
  e: String? = null;
}

contract MixedFormats {
  data: Mixed;

  init() {
    self.data = Mixed{
      a: 10,
      b: 255,
      d: -500
    };
  }
}
