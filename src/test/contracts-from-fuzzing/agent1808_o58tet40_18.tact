contract OptionalPrimitives {
  oInt: Int?;
  oBool: Bool?;
  oAddress: Address?;
  oStr: String?;
  oCell: Cell?;

  init() {
    self.oInt = null;
    self.oBool = true;
    self.oAddress = null;
    self.oStr = "hello";
    self.oCell = null;
  }
}