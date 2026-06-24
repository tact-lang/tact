contract OptionalUninit {
  optInt: Int?;
  optBool: Bool?;

  init() {
    // Intentionally do not assign optBool here
    self.optInt = null;
  }
}