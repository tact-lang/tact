contract ExplicitDefault {
  val1: Int = 1;
  val2: Bool = true;
  val3: String = "hi";

  init() {
    self.val2 = false;
  }

  receive() {
    let _ = self.val3;
  }
}
