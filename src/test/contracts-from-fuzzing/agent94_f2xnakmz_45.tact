contract ManySerialized {
  a: Int as uint4;
  b: Int as int8;
  c: Int as uint16;
  d: Int as int32;
  e: Int as uint64;

  init() {
    self.a = 15;
    self.b = -128;
    self.c = 65535;
    self.d = -2147483648;
    self.e = 18446744073709551615;
  }
}