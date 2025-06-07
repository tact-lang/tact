struct WeirdInts {
  a: Int as uint7;
  b: Int as int123;
  c: Int as uint256;
  d: Int;
}

contract WeirdSerial {
  data: WeirdInts;

  init() {
    self.data = WeirdInts{
      a: 5,
      b: -1234,
      c: 999999999,
      d: -1
    };
  }
}
