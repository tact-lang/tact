contract Bits {
  a: Int as uint4;
  b: Int as uint8;
  c: Int as int16;
  d: Int as int64;
  e: Int as coins;
  f: Bool;
  g: Bool?;
  h: Int?;
  i: Address?;
  init() {
    self.a = 5;
    self.b = 255;
    self.c = -12345;
    self.d = 123456789;
    self.e = 1000;
    self.f = false;
    self.g = null;
    self.h = null;
    self.i = null;
  }
}