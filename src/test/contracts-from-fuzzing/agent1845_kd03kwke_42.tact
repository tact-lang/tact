// Contract directly with many optionals of different supported primitive types
contract MultiBaseOptionals {
  intOpt: Int?;
  boolOpt: Bool?;
  stringOpt: String?;
  addrOpt: Address?;
  cellOpt: Cell?;
  sliceOpt: Slice?;

  init() {
    self.intOpt=null; self.boolOpt=null; self.stringOpt=null;
    self.addrOpt=null; self.cellOpt=null; self.sliceOpt=null;
  }
}
