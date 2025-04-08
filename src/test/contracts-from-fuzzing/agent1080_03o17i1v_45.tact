contract IntTypes {
  a: Int as uint8;
  b: Int as int8;
  c: Int as uint32;
  d: Int as int64;

  init() {
    self.a = 255;
    self.b = -128;
    self.c = 4294967295;
    self.d = -9223372036854775808;
  }
}