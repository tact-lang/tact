contract OnlyOptionals {
  arg1: Int?;
  arg2: Bool?;
  arg3: String?;

  init() {
    self.arg1 = null;
    self.arg2 = null;
    self.arg3 = null;
  }
}