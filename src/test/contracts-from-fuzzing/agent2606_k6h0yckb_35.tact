contract OverlapAlias {
  a: Int as int16;
  b: Int as uint8;
  c: Int as int64;

  init() {
    self.a = -123;
    self.b = 200;
    self.c = 123456789;
  }
}