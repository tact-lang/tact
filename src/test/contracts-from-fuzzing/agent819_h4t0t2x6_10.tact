struct WeirdInts {
  a: Int as uint1;
  b: Int as uint4;
  c: Int as uint8;
  d: Int as int16;
  e: Int as uint32;
  f: Int as int64;
  g: Int as uint128;
  h: Int as int257;
}

contract TestContract {
  stuff: WeirdInts;

  init() {
    self.stuff = WeirdInts{
      a: 1,
      b: 5,
      c: 200,
      d: -1000,
      e: 1000000,
      f: -5000000,
      g: 123456789012345,
      h: -1234567890123456789012345678901234567890
    };
  }
}