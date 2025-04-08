contract OptUpdate {
  opt: Int?;

  init() {
    self.opt = null;
    self.opt = 5;
    self.opt = null;
  }
}