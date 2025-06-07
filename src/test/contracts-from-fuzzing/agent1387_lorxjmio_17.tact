contract TestContract {
  a: Int as uint4 = 1;
  b: Int as int8 = -4;
  c: Int as uint8 = 255;
  d: Int as int32 = -1000;
  e: Int as uint64 = 123456789;

  init() {
    self.a = 7;
    self.b = -8;
    self.c = 254;
    self.d = -2000;
    self.e = 999999999;
  }
}