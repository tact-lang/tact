// Contract with many mixed Int serializations
contract MultipleIntSerializations {
  a: Int as uint4;
  b: Int as uint8;
  c: Int as uint16;
  d: Int as uint32;
  e: Int as int64;
  f: Int;

  init() {
    self.a = 5;
    self.b = 100;
    self.c = 1000;
    self.d = 100000;
    self.e = -500000;
    self.f = 123456789012345678901234567890;
  }
}