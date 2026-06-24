contract IntsWithSerialization {
  a: Int as int64;
  b: Int as uint1;
  c: Int as uint32;
  d: Int;

  init() {
    self.a = 5;
    self.b = 1;
    self.c = 1024;
    self.d = -123;
  }
}