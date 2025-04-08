contract UnusualOrder {
  b: Int as uint8;
  a: Int;
  d: Bool?;
  c: Int as int16;

  init() {
    self.b = 255;
    self.a = -1;
    self.d = null;
    self.c = -1000;
  }
}