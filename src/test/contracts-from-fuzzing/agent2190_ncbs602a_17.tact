contract IntVariety {
  i1: Int as int8;
  i2: Int as int16;
  i3: Int as uint32;
  i4: Int as uint64;
  i5: Int as int257;

  init() {
    self.i1 = 1;
    self.i2 = 2;
    self.i3 = 3;
    self.i4 = 4;
    self.i5 = 5;
  }
}