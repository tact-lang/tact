contract StorageMix {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;

  init() {
    self.intVal = 1;
    self.boolVal = true;
    self.strVal = "Tact";
    self.optInt = null;
    self.optBool = null;
    self.optStr = null;
  }
}