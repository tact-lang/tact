struct VariousSerialized {
  a: Int as int2;
  b: Int as uint4;
  c: Int as int8;
  d: Int as uint16;
  e: Int as int32;
  f: Int as uint64;
  g: Int as int128;
  h: Int as uint256;
}

contract SerializeVariety {
  data: VariousSerialized;

  init() {
    self.data = VariousSerialized{
      a: -1,
      b: 15,
      c: -128,
      d: 65535,
      e: -2147483648,
      f: 18446744073709551615,
      g: -170141183460469231731687303715884105728,
      h: 115792089237316195423570985008687907853269984665640564039457584007913129639935
    };
  }
}
