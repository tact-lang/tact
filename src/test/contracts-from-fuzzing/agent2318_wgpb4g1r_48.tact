contract SerializeOptionals {
  u8: Int? as uint8 = null;
  i8: Int? as int8 = null;
  u16: Int? as uint16 = null;
  i16: Int? as int16 = null;
  u32: Int? as uint32 = null;
  i32: Int? as int32 = null;
  u64: Int? as uint64 = null;
  i64: Int? as int64 = null;

  init() {
    self.u8 = 7;
    self.i8 = -7;
    self.u16 = 77;
    self.i16 = -77;
    self.u32 = 777;
    self.i32 = -777;
    self.u64 = 7777;
    self.i64 = -7777;
  }
}
