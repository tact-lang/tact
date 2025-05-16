contract SerializeVariants {
  val1: Int as uint32;
  val2: Int as int64;
  val3: Int as uint8;
  val4: Int;

  init() {
    self.val1 = 1;
    self.val2 = 2;
    self.val3 = 3;
    self.val4 = 4;
  }
}