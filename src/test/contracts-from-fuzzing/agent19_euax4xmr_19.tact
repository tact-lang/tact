contract Test {
  small: Int as uint4;

  init() {
    self.small = 16; // too big, uint4 max is 15
  }
}