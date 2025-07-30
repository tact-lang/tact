contract SerializeInts {
  a: Int as uint8;
  b: Int as uint16;
  c: Int as int32;
  d: Int as uint64;
  e: Int as int256;

  init() {
    self.a = 255;
    self.b = 65535;
    self.c = 2147483647;
    self.d = 18446744073709551615;
    self.e = -1;
  }
}