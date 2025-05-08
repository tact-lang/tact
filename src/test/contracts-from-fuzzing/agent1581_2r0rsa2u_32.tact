contract SerializedSizes {
  tiny: Int as uint4;
  small: Int as uint8;
  medium: Int as uint16;
  big: Int as int64;

  init() {
    self.tiny = 7;
    self.small = 42;
    self.medium = 233;
    self.big = -123456789;
  }
}