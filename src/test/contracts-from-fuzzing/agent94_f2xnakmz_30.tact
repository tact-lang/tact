contract SerializeSizes {
  a: Int as uint1;
  b: Int as uint8;
  c: Int as uint16;
  d: Int as uint32;
  e: Int as uint64;
  f: Int as uint128;
  g: Int as uint256;

  init() {
    self.a=1; self.b=255; self.c=65535; self.d=4294967295; 
    self.e=18446744073709551615; self.f=340282366920938463463374607431768211455; 
    self.g=115792089237316195423570985008687907853269984665640564039457584007913129639935;
  }
}