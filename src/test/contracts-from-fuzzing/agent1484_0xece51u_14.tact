struct MixedOptSerial {
  a: Int as uint8;
  b: Int?;
  c: Bool?;
  d: String;
}

contract MixedOptionalSerialized {
  m: MixedOptSerial;

  init() {
    self.m = MixedOptSerial{
      a: 12,
      b: null,
      c: null,
      d: "hello"
    };
  }
}