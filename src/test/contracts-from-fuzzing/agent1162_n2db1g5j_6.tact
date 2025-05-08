contract MultiPrimitiveFields {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  cellVal: Cell;
  sliceVal: Slice;
  builderVal: Builder;
  addrVal: Address;

  init() {
    self.intVal = 33;
    self.boolVal = true;
    self.strVal = "hello";
    self.cellVal = emptyCell();
    self.sliceVal = emptyCell().asSlice();
    self.builderVal = beginCell();
    self.addrVal = myAddress();
  }
}