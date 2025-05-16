contract OnlyTypes {
  intVal: Int;
  boolVal: Bool;
  stringVal: String;
  cellVal: Cell;
  sliceVal: Slice;
  builderVal: Builder;
  addressVal: Address;

  init() {
    self.intVal = 42;
    self.boolVal = true;
    self.stringVal = "abc";
    self.cellVal = emptyCell();
    self.sliceVal = emptyCell().asSlice();
    self.builderVal = beginCell();
    self.addressVal = myAddress();
  }
}