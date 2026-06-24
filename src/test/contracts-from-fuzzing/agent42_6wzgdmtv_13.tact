contract OptionalTweak {
  s: String?;
  b: Bool?;
  n: Int?;

  init() {
    self.s = "hello";
    self.b = null;
    self.n = 100;
  }
}