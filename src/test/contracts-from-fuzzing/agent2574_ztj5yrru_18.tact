contract SerialSizes {
  a: Int as int64 = -64;
  b: Int as uint4 = 7;
  c: Int as uint256 = 42;

  init() {
    self.a = 0;
    self.b = 15;
    self.c = 5000000000;
  }
}