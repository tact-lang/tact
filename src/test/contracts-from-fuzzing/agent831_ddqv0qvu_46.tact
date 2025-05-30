contract NumericWidths {
  a: Int as uint8;
  b: Int as int64;
  c: Int as uint128;
  d: Int as int256;

  init() {
    self.a = 255;
    self.b = -123456789;
    self.c = 123456789101112131415;
    self.d = -123456789101112131415;
  }
}