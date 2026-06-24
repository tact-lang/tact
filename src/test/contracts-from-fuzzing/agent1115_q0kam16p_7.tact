// test contract with various serialization widths
struct SizedInts {
  a: Int as uint8;
  b: Int as int16;
  c: Int as uint32;
  d: Int as int64;
  e: Int as uint128;
}

contract TestContract {
  data: SizedInts;

  init() {
    self.data = SizedInts{
      a: 255,
      b: -12345,
      c: 1234567890,
      d: -11223344556677,
      e: 340282366920938463463374607431768211455
    };
  }
}