contract OptionalDeep {
  innermost: Int?;
  optStr: String?;
  finalFlag: Bool;

  init() {
    self.innermost = null;
    self.optStr = null;
    self.finalFlag = false;
  }
}
