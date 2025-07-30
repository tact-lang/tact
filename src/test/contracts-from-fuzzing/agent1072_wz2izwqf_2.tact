contract WideVarietyTest {
  intVal: Int;
  boolVal: Bool;
  addressVal: Address;
  cellVal: Cell;
  sliceVal: Slice;
  stringVal: String;
  intOpt: Int?;
  boolOpt: Bool?;
  addressOpt: Address?;
  cellOpt: Cell?;
  sliceOpt: Slice?;
  stringOpt: String?;

  init() {
    self.intVal = 42;
    self.boolVal = true;
    self.addressVal = myAddress();
    self.cellVal = emptyCell();
    self.sliceVal = emptyCell().asSlice();
    self.stringVal = "hi";
    self.intOpt = null;
    self.boolOpt = false;
    self.addressOpt = null;
    self.cellOpt = null;
    self.sliceOpt = null;
    self.stringOpt = null;
  }
}
