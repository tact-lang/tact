contract DifferentSerialization {
  a: Int as int16;
  b: Int as uint32;
  c: Int as int64;
  d: Int;

  init() {
    self.a = -10;
    self.b = 10000;
    self.c = -123456;
    self.d = 9999999;
  }
}