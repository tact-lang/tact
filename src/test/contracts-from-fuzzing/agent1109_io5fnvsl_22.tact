contract MixedSerialization {
  a: Int as uint8;
  b: Int as int64;
  c: Int as uint256;
  d: Int; // default int257

  init() {
    self.a = 1;
    self.b = -5;
    self.c = 123456789;
    self.d = -123456789;
  }
}