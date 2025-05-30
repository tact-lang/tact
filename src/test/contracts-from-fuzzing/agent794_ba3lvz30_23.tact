struct MixedSerialize {
  a: Int as uint64;
  b: Int as int16;
  c: Int as uint1;
  d: Int as int257;
}

contract SerializeEdges {
  data: MixedSerialize;

  init() {
    self.data = MixedSerialize{
      a: 18446744073709551615, // 2^64 - 1
      b: -32768, // min int16
      c: 1,      // max uint1
      d: -57896044618658097711785492504343953926634992332820282019728792006155588075520 // -2^256
    };
  }
}
