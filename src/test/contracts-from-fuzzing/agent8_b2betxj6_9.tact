contract ManyPrimitives {
  intField: Int;
  boolField: Bool;
  stringField: String;
  cellField: Cell;
  sliceField: Slice;
  addressField: Address;

  init() {
    self.intField = 1;
    self.boolField = false;
    self.stringField = "s";
    self.cellField = emptyCell();
    self.sliceField = emptyCell().asSlice();
    self.addressField = myAddress();
  }
}