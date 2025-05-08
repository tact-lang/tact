contract MultiPrimitive {
  intField: Int;
  boolField: Bool;
  strField: String;
  cellField: Cell;
  sliceField: Slice;
  builderField: Builder;
  addressField: Address;
  optInt: Int?;

  init() {
    self.intField = 123;
    self.boolField = true;
    self.strField = "str";
    self.cellField = emptyCell();
    self.sliceField = emptyCell().asSlice();
    self.builderField = beginCell();
    self.addressField = myAddress();
    self.optInt = null;
  }
}
