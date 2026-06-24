contract HugeIntFields {
  a: Int;
  b: Int as int64;
  c: Int as uint8;
  d: Int as uint32;

  init() {
    self.a = 123;
    self.b = 42;
    self.c = 7;
    self.d = 500;
  }
}