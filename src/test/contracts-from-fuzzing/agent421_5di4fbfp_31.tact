struct IntSizes {
  i8: Int as int8;
  i16: Int as int16;
  i32: Int as int32;
  i64: Int as int64;
  i128: Int as int128;
  i256: Int as int256;
}

contract IntSerialization {
  data: IntSizes;

  init() {
    self.data = IntSizes{ i8:1, i16:2, i32:3, i64:4, i128:5, i256:6 };
  }
}