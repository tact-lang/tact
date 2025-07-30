contract Variety {
  intVal: Int;
  boolVal: Bool;
  stringVal: String;
  optInt: Int?;
  optBool: Bool?;
  str2: String;

  init() {
    self.intVal = 123;
    self.boolVal = true;
    self.stringVal = "test";
    self.optInt = null;
    self.optBool = false;
    self.str2 = "world";
  }
}