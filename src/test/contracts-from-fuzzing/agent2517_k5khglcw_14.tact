contract SerHints {
  a: Int as int64;
  b: Int as uint8;
  c: Int as uint256;
  d: Int as int1;
  e: Int as uint4;
  f: Int as int257;

  init() {
    self.a = 1;
    self.b = 2;
    self.c = 3;
    self.d = 0;
    self.e = 4;
    self.f = 5;
  }
}