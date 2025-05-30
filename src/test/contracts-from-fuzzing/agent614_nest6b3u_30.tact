contract SerializeWithOpt {
  val1: Int as uint8;
  optStr: String?;
  val2: Int as uint32;

  init() {
    self.val1 = 10;
    self.optStr = null;
    self.val2 = 5000;
  }
}