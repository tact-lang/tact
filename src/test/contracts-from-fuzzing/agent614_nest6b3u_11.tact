contract OptionalAtFirst {
  optStr: String?;
  num: Int;

  init() {
    self.optStr = null;
    self.num = 42;
  }
}