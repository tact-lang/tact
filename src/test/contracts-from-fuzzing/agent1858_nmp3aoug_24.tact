contract BoolOptionalConsts {
  flag1: Bool = true;
  flag2: Bool? = null;
  flag3: Bool?;

  init() {
    self.flag1 = false;
    self.flag2 = true;
    self.flag3 = null;
  }
}