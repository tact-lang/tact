contract Test {
  val1: Int = -1;
  val2: Int?;
  val3: Bool = true;
  val4: Bool?;
  val5: String = "text";
  val6: String?;

  init() {
    self.val2 = null;
    self.val4 = null;
    self.val6 = null;
  }
}
