contract ManyOptionalPrimitives {
  intOpt: Int?;
  boolOpt: Bool?;
  stringOpt: String?;
  sliceOpt: Slice?;
  cellOpt: Cell?;
  addrOpt: Address?;

  init() {
    self.intOpt = null;
    self.boolOpt = null;
    self.stringOpt = null;
    self.sliceOpt = null;
    self.cellOpt = null;
    self.addrOpt = null;
  }
}