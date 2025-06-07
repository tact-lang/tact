contract DifferentSerializations {
  a: Int as coins;
  b: Int as int257;
  c: Int as uint128;
  d: Int;

  init() {
    self.a = 1;
    self.b = -2;
    self.c = 3;
    self.d = 4;
  }
}