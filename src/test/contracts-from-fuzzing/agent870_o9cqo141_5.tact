contract OptionalFieldsTest {
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
  optAddress: Address?;
  optCell: Cell?;
  optSlice: Slice?;
  optBuilder: Builder?;

  init() {
    self.optInt = null;
    self.optBool = null;
    self.optStr = null;
    self.optAddress = null;
    self.optCell = null;
    self.optSlice = null;
    self.optBuilder = null;
  }
}