contract OnlyPrimitives {
  intField: Int;
  boolField: Bool;
  stringField: String;
  cellField: Cell;
  sliceField: Slice;
  addressField: Address;

  init() {
    self.intField = 11;
    self.boolField = false;
    self.stringField = "xy";
    self.cellField = emptyCell();
    self.sliceField = emptyCell().asSlice();
    self.addressField = myAddress();
  }
}
