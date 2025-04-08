contract OptionalsInInit {
  a: Int?;
  b: Bool?;

  init() {
    self.a = 10;
    self.b = null;
  }
}