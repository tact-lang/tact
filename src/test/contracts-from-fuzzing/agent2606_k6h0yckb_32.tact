contract CompressedInts {
  a: Int as uint4;
  b: Int as uint8;
  c: Int as int16;

  init() {
    self.a = 7;
    self.b = 200;
    self.c = -123;
  }
}