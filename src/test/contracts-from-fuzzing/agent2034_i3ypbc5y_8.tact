contract OptionalPrimitives {
  optInt: Int?;
  optBool: Bool?;
  optAddr: Address?;
  optCell: Cell?;
  optSlice: Slice?;
  optStr: String?;

  init() {
    self.optInt = null;
    self.optBool = null;
    self.optAddr = null;
    self.optCell = null;
    self.optSlice = null;
    self.optStr = null;
  }
}