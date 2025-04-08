// Struct with many different integer serialization sizes
struct VariousInts {
  a: Int as uint4;
  b: Int as int8;
  c: Int as uint16;
  d: Int as int32;
  e: Int as uint64;
  f: Int as int128;
  g: Int as uint256;
}

contract TestContract {
  data: VariousInts;

  init() {
    self.data = VariousInts{
      a: 3,
      b: -7,
      c: 5000,
      d: -100000,
      e: 100000000,
      f: -999999999999,
      g: 12345678901234567890,
    };
  }
}