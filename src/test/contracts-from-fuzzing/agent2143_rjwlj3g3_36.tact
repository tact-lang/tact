contract MinSerializedInts {
  a: Int as uint1;
  b: Int as uint4;
  c: Int as int8;

  init() {
    self.a = 1;
    self.b = 5;
    self.c = -10;
  }
}