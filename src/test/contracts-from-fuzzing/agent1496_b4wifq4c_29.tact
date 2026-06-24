contract IntSerializations {
  a: Int as int16;
  b: Int as uint5;
  c: Int as int64;

  init() {
    self.a = 42;
    self.b = 7;
    self.c = -1000;
  }
}