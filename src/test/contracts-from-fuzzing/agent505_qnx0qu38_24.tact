contract OptionalFields {
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;

  init() {
    self.optInt = null;
    self.optBool = true;
    self.optStr = null;
  }

  receive() {
    self.optInt = self.optInt;
  }
}