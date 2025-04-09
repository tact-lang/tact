contract SerializedInts {
  a: Int as uint4;
  b: Int as uint8;
  c: Int as int16;
  d: Int as uint32;
  e: Int as int64;

  init() {
    self.a=7; self.b=255; self.c=32000; self.d=429496729; self.e=10000000000;
  }
}