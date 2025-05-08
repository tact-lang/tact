contract Test29 {
  a: Int as uint32;
  b: Int as int64;
  c: Int as int257;

  init() {
    self.a = 12345;
    self.b = -54321;
    self.c = 9876543210;
  }
}