contract SerialBugTest {
  a: Int as uint8 = 100;
  b: Int as int64 = -5;
  c: Int as uint4 = 3;
  d: Int as int32 = -33;

  init() {
    self.a = 1;
    self.b = 2;
    self.c = 3;
    self.d = 4;
  }
}