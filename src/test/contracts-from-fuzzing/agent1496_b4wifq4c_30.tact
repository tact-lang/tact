contract IntDefaults {
  a: Int as uint8 = 255;
  b: Int as uint4 = 15;
  c: Int as int16 = -12345;

  init() {
    self.a = 255;
    self.b = 14;
    self.c = -12345;
  }
}