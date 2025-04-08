contract OnlyManyFields {
  a: Int;
  b: Bool;
  s: String;
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;

  init() {
    self.a = 1;
    self.b = true;
    self.s = "ok";
    self.optInt = null;
    self.optBool = false;
    self.optStr = null;
  }
}