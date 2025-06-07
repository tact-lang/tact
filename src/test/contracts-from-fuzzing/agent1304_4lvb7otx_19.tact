contract SignedUnsigned {
  a: Int as int32;
  b: Int as uint32;
  c: Int as int64;
  d: Int as uint64;

  init() {
    self.a = -10;
    self.b = 123;
    self.c = -123456;
    self.d = 7890123;
  }
}