struct MixSerial {
  a: Int as uint8;
  b: Int as int16;
  c: Int as uint32;
  d: Int;
}

contract TestContract {
  ms: MixSerial;

  init() {
    self.ms = MixSerial{ a: 255, b: -12345, c: 4000000000, d: 12345678901234567890 };
  }
}