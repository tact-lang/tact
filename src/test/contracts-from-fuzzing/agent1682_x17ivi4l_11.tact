contract TestContract {
  a: Int = 1;
  b: Bool = true;
  c: String = "hi";
  d: Int?;
  e: Bool?;

  init() {
    self.d = null;
    self.e = false;
  }
}