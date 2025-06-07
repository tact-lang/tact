contract ManySmallInts {
  a: Int as uint4;
  b: Int as uint8;
  c: Int as uint16;
  d: Int as uint32;
  e: Int as uint64;

  init() {
    self.a=1; self.b=1; self.c=1; self.d=1; self.e=1;
  }
}
