contract ComplexFields {
  intVal: Int;
  boolVal: Bool;
  optInt: Int?;
  strVal: String;
  optBool: Bool?;

  init() {
    self.intVal = 10;
    self.boolVal = true;
    self.optInt = null;
    self.strVal = "hi";
    self.optBool = false;
  }
}