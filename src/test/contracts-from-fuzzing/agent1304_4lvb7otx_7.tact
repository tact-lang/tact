contract SerialAnnots {
  a: Int as uint8;
  b: Int as uint64;
  c: Int as coins;

  init() {
    self.a = 5;
    self.b = 123456789;
    self.c = 1000000000;
  }
}