contract MultiTypeFields {
  intField: Int;
  boolField: Bool;
  addrField: Address;
  cellField: Cell;
  sliceField: Slice;
  stringField: String;

  init() {
    self.intField = 5;
    self.boolField = true;
    self.addrField = myAddress();
    self.cellField = emptyCell();
    self.sliceField = emptyCell().asSlice();
    self.stringField = "testing";
  }
}