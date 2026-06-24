contract Test {
  count: Int = 0;
  flag: Bool = false;
  message: String = "";
  optVal: Int?;
  deepOpt: String?;

  init() {
    self.optVal = null;
    self.deepOpt = null;
  }
}