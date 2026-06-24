contract OutOfRangeDefault {
  small: Int as uint3 = 9;
  init() {
    self.small = 2;
  }
}