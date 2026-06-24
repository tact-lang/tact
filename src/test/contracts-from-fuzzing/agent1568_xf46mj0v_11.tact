contract MixedPersistent {
  cInt: Int = 0;
  cBool: Bool = true;
  cStr: String = "start";

  init() {
    self.cInt = -5;
    self.cBool = false;
    self.cStr = "done";
  }
}