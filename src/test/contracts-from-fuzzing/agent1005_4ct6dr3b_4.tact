contract MultiFields {
  intField: Int;
  boolField: Bool;
  strField: String;
  cellField: Cell;
  sliceField: Slice;
  addressField: Address;

  init() {
    self.intField = 1;
    self.boolField = true;
    self.strField = "abc";
    self.cellField = emptyCell();
    self.sliceField = emptyCell().asSlice();
    self.addressField = myAddress();
  }
}