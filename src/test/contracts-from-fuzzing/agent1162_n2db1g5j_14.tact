contract OptionalPrimitives {
  intOpt: Int?;
  boolOpt: Bool?;
  stringOpt: String?;
  cellOpt: Cell?;
  sliceOpt: Slice?;
  builderOpt: Builder?;
  addrOpt: Address?;

  init() {
    self.intOpt = null;
    self.boolOpt = null;
    self.stringOpt = null;
    self.cellOpt = null;
    self.sliceOpt = null;
    self.builderOpt = null;
    self.addrOpt = null;
  }
}