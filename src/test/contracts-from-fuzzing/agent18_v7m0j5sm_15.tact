contract NullableStringTest {
  val1: String?;
  val2: String?;

  init() {
    self.val1 = null;
    self.val2 = "hi";
  }
}