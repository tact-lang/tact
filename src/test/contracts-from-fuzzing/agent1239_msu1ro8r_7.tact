contract AllInts {
  s: Int;
  u4: Int as uint4;
  u8: Int as uint8;
  u32: Int as uint32;
  i4: Int as int4;
  i8: Int as int8;
  i32: Int as int32;

  init() {
    self.s = -10;
    self.u4 = 5;
    self.u8 = 10;
    self.u32 = 777;
    self.i4 = -3;
    self.i8 = -9;
    self.i32 = -128;
  }
}