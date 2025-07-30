contract SerialPrimitiveMixed {
  f1: Int as uint8;
  f2: Int as int16;
  f3: Int as uint64;
  f4: Int;

  init() {
    self.f1 = 1;
    self.f2 = -2;
    self.f3 = 3;
    self.f4 = -4;
  }
}
