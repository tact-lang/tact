contract MultipleSerialize {
  a: Int as uint8;
  b: Int as int257;
  c: Int as int1;
  d: Int as uint256;

  init() {
    self.a = 1;
    self.b = 2;
    self.c = -1;
    self.d = 3;
  }
}