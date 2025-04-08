contract UnusualSerializations {
  a: Int as uint1;
  b: Int as int7;
  c: Int as uint11;

  init() {
    self.a = 1;
    self.b = -10;
    self.c = 1023;
  }
}