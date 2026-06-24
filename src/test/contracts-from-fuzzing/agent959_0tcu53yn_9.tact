contract InitialNulls {
  opt1: Int?;
  opt2: String?;
  flag: Bool;

  init() {
    self.opt1 = null;
    self.opt2 = null;
    self.flag = true;
  }
}