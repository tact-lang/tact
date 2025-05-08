contract SerializeBits {
  u4: Int as uint4;
  u8: Int as uint8;
  i8: Int as int8;
  big: Int;

  init() {
    self.u4 = 7;
    self.u8 = 255;
    self.i8 = -128;
    self.big = -123456789012345678901234567890;
  }
}
