struct Ints {
  a: Int as int64;
  b: Int as uint64;
  c: Int as int8;
  d: Int as uint8;
  e: Int as int1;
  f: Int as uint1;
}

contract IntSerializations {
  ints: Ints;

  init() {
    self.ints = Ints{
      a: -7,
      b: 42,
      c: -8,
      d: 255,
      e: 1,
      f: 1
    };
  }
}
