contract IntSerialization {
  tiny: Int as uint1; // only 1 bit, accepts 0 or 1
  big: Int as int257; // full range

  init() {
    self.tiny = 1;
    self.big = -123456789012345678901234567890;
  }
}