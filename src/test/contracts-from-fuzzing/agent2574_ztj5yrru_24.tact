struct FullRange {
  int8v: Int as int8;
  int16v: Int as int16;
  int64v: Int as int64;
  int257v: Int;
  uint4v: Int as uint4;
  uint128v: Int as uint128;
}

contract SerializeRange {
  sr: FullRange;

  init() {
    self.sr = FullRange{
      int8v: -128, int16v: -32768, int64v: -9223372036854775808,
      int257v: -57896044618658097711785492504343953926634992332820282019728792006155588075520,
      uint4v: 15, uint128v: 340282366920938463463374607431768211455
    };
  }
}