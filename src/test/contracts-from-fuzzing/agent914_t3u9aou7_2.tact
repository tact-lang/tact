contract OptionalPrimitives {
  optInt: Int?;
  optBool: Bool?;
  optAddress: Address?;
  optCell: Cell?;
  optSlice: Slice?;
  optString: String?;

  init() {
    self.optInt = null;
    self.optBool = true;
    self.optAddress = null;
    self.optCell = null;
    self.optSlice = null;
    self.optString = "Hello";
  }
}