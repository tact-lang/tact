struct MaxUInts {
  u8: Int as uint8;
  u16: Int as uint16;
  u32: Int as uint32;
  u64: Int as uint64;
  u128: Int as uint128;
  u256: Int as uint256;
}

contract MaxUIntSizes {
  data: MaxUInts;

  init() {
    self.data = MaxUInts{
      u8: 255,
      u16: 65535,
      u32: 4294967295,
      u64: 18446744073709551615,
      u128: 340282366920938463463374607431768211455,
      u256: 115792089237316195423570985008687907853269984665640564039457584007913129639935
    };
  }
}