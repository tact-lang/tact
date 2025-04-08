contract DifferentInitializations {
  a: Int = 10;
  b: Bool;
  c: String = "sss";

  init() {
     self.b = true;
  }
}