contract SerialFormats {
  val1: Int as uint8;
  val2: Int as int64;
  val3: Int as uint4;

  init() {
    self.val1 = 5;
    self.val2 = -1000;
    self.val3 = 13;
  }
}