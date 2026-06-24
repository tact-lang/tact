contract Test22 {
  a: Int as uint8;
  b: Int as int8;
  c: Int as uint16;
  d: Int as int32;
  e: Int as uint64;
  f: Int as int128;
  init() {
    self.a = 255;
    self.b = -128;
    self.c = 65535;
    self.d = -1234567;
    self.e = 123456789012345;
    self.f = -123456789012345678901234567890;
  }
}
