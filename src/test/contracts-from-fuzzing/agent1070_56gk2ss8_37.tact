contract SerialMix {
  a: Int as uint8;
  b: Int as int64;
  c: Int as uint16;
  d: Int as int32;

  init() {
    self.a = 1;
    self.b = -123;
    self.c = 456;
    self.d = -789;
  }
}