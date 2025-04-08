// test primitive fields with serialization types
contract SerialTypes {
  s8: Int as int8;
  u8: Int as uint8;
  s16: Int as int16;
  u16: Int as uint16;
  s32: Int as int32;
  u32: Int as uint32;

  init() {
    self.s8  = -5;
    self.u8  = 255;
    self.s16 = -30000;
    self.u16 = 65535;
    self.s32 = -2_000_000_000;
    self.u32 = 4_000_000_000;
  }
}
