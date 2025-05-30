contract DualTyped {
  intVal: Int;
  strVal: String;
  optInt: Int?;
  optStr: String?;

  init() {
    self.intVal = 5;
    self.strVal = "5";
    self.optInt = null;
    self.optStr = null;
  }
}
