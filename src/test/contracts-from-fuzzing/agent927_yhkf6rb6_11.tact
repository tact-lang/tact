contract MultiSerial {
  u8: Int as uint8;
  i8: Int as int8;
  u64: Int as uint64;
  i64: Int as int64;
  u1: Int as uint1;
  i257: Int as int257;

  init() {
    self.u8 = 255;
    self.i8 = -128;
    self.u64 = 1000;
    self.i64 = -1000;
    self.u1 = 1;
    self.i257 = 0;
  }
}