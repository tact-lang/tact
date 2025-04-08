contract SerialDefault {
  a: Int as uint32 = 1;
  b: Int as int64 = -1;
  c: Int = 0;

  init() {
    self.a = 5;
    self.b = -100;
    self.c = 999;
  }
}