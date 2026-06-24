contract MixedTypes {
  intVal: Int;
  boolVal: Bool;
  txtVal: String;
  optIntVal: Int?;
  optBoolVal: Bool?;
  optTxtVal: String?;

  init() {
    self.intVal = 5;
    self.boolVal = true;
    self.txtVal = "hi";
    self.optIntVal = null;
    self.optBoolVal = null;
    self.optTxtVal = null;
  }
}