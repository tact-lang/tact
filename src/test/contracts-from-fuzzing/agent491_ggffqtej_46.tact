struct LargeNumeric {
  i8: Int as int8;
  ui8: Int as uint8;
  i16: Int as int16;
  ui16: Int as uint16;
  i32: Int as int32;
  ui32: Int as uint32;
  i64: Int as int64;
  ui64: Int as uint64;
  i128: Int as int128;
  ui128: Int as uint128;
  norm: Int;
}

contract AllIntKinds {
  data: LargeNumeric;

  init() {
    self.data = LargeNumeric{
      i8:1,ui8:2,i16:3,ui16:4,i32:5,ui32:6,i64:7,ui64:8,i128:9,ui128:10,norm:11
    };
  }
}
