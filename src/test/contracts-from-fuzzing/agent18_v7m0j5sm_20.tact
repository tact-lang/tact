contract EmptyOptionalFields {
  opt1: Int?;
  opt2: Int?;

  init() {
    self.opt1 = null;
    self.opt2 = null;
  }
}