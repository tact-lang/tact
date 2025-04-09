struct LongTuple {
  f01: Int = 1; f02: Int = 2; f03: Int = 3; f04: Int = 4;
  f05: Int = 5; f06: Int = 6; f07: Int = 7; f08: Int = 8;
  f09: Int = 9; f10: Int = 10; f11: Int = 11; f12: Int = 12;
  f13: Int = 13; f14: Int = 14; f15: Int = 15; f16: Int = 16;
}

contract LongTupleTest {
  vals: LongTuple = LongTuple{
    f01:1,f02:2,f03:3,f04:4,f05:5,f06:6,f07:7,f08:8,
    f09:9,f10:10,f11:11,f12:12,f13:13,f14:14,f15:15,f16:16
  };
  init() {}
}