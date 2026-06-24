contract SerializeInts {
  a: Int as uint8;
  b: Int as int64;
  c: Int as coins;

  init() {
    self.a = 255;
    self.b = -5000;
    self.c = ton("1");
  }
}