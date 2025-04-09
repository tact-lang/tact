contract MixSerialized {
  u8: Int as uint8 = 255;
  i8: Int as int8 = -128;
  u16: Int as uint16 = 65535;
  i16: Int as int16 = -32768;
  u32: Int as uint32 = 4294967295;
  i32: Int as int32 = -2147483648;
  u64: Int as uint64 = 18446744073709551615;
  i64: Int as int64 = -9223372036854775808;

  init() {
    self.u8 = 0;
    self.i8 = 0;
    self.u16 = 0;
    self.i16 = 0;
    self.u32 = 0;
    self.i32 = 0;
    self.u64 = 0;
    self.i64 = 0;
  }
}
