contract ComplexOptionalDefaults {
  optInt: Int? = null;
  optBool: Bool? = null;
  optStr: String? = null;
  optAddr: Address? = null;
  optCell: Cell? = null;

  init() {
    self.optInt = null;
    self.optBool = null;
    self.optStr = null;
    self.optAddr = null;
    self.optCell = null;
  }
}