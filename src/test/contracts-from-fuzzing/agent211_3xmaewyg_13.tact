contract MultiSerialization {
  ubit4: Int as uint4;
  bit8: Int as int8;
  ubit16: Int as uint16;
  bit32: Int as int32;
  bit257: Int as int257;

  init() {
    self.ubit4 = 5;
    self.bit8 = -10;
    self.ubit16 = 200;
    self.bit32 = -123456;
    self.bit257 = 12345678901234567890;
  }
}
