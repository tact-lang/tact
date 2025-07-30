contract WithSerializations {
  a: Int as uint8;
  b: Int as int32;
  c: Int as coins;

  init() {
    self.a = 5;
    self.b = -7;
    self.c = ton("1");
  }
}