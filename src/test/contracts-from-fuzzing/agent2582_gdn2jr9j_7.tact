contract Test {
  val1: Int = 1;
  val2: Bool = true;
  val3: String = "abc";
  val4: Int?;
  val5: Bool?;
  val6: String?;

  init() {
    self.val4 = null;
    self.val5 = null;
    self.val6 = null;
  }
}
