contract SerialFormats {
  i8: Int as int8;
  u7: Int as uint7;
  i120: Int as int120;
  u250: Int as uint250;

  init() {
    self.i8 = 1;
    self.u7 = 2;
    self.i120 = 3;
    self.u250 = 4;
  }
}