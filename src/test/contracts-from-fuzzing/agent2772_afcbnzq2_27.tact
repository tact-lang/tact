contract DefaultsOptional {
  optInt: Int? = null;
  optBool: Bool? = null;

  init() {
    self.optInt = 123;
    self.optBool = true;
  }
}
