contract MixedSerialized {
  a: Int as uint8;
  b: Int as uint64;
  c: Int as int4;
  d: Int;

  init() {
    self.a = 0;
    self.b = 0;
    self.c = 0;
    self.d = 0;
  }
}