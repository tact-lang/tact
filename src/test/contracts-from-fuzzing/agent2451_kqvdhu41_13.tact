contract SerialOrder {
  a: Int as uint8;
  b: Int as int16;
  c: Int as uint32;
  d: Int as coins;

  init() {
    self.a = 1;
    self.b = -123;
    self.c = 123456;
    self.d = 1000;
  }
}