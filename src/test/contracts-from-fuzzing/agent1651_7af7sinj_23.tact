contract SerializeMix {
  a: Int as uint8;
  b: Int;
  c: Int as int16;
  d: Int as coins;
  e: Int;

  init() {
    self.a = 250;
    self.b = 1000;
    self.c = -2000;
    self.d = 9999999999;
    self.e = 42;
  }
}