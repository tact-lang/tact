struct MaxInts {
  i8: Int as int8;
  i16: Int as int16;
  i32: Int as int32;
  i64: Int as int64;
  i128: Int as int128;
  i256: Int as int256;
}

contract MaxIntSizes {
  data: MaxInts;

  init() {
    self.data = MaxInts{
      i8: 127,
      i16: 32767,
      i32: 2147483647,
      i64: 9223372036854775807,
      i128: 170141183460469231731687303715884105727,
      i256: 57896044618658097711785492504343953926634992332820282019728792003956564819967
    };
  }
}