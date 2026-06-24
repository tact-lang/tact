contract OptPrimitive {
  optInt: Int?;
  optBool: Bool?;
  optString: String?;

  init() {
    self.optInt = 99;
    self.optBool = null;
    self.optString = "test";
  }
}