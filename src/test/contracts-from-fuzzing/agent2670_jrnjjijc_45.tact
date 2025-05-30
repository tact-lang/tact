contract SerializeAll {
  a: Int as int16;
  b: Int as uint8;
  c: Int as int1;
  d: Int as uint32;

  init() {
    self.a = 11;
    self.b = 22;
    self.c = 0;
    self.d = 33;
  }
}