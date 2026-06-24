contract BoolStringCombo {
  flag: Bool;
  msg: String;
  flag2: Bool;
  optionalMsg: String?;

  init() {
    self.flag = true;
    self.msg = "Hello";
    self.flag2 = false;
    self.optionalMsg = null;
  }
}