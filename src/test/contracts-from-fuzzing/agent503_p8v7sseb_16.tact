contract SerModifiers {
  a: Int as uint8;
  b: Int as uint16;
  c: Int as int32;
  d: Int as uint64;
  e: Int as int128;
  f: Int;

  init() {
    self.a = 10;
    self.b = 300;
    self.c = -12000;
    self.d = 12345678901234;
    self.e = -1234567890123456789;
    self.f = 42;
  }
}
