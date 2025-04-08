contract PrimitiveTypes {
  intVal: Int;
  boolVal: Bool;
  cellVal: Cell;
  sliceVal: Slice;
  strVal: String;
  builderVal: Builder;
  addrVal: Address;

  init() {
    self.intVal = 1;
    self.boolVal = true;
    self.cellVal = emptyCell();
    self.sliceVal = emptyCell().asSlice();
    self.strVal = "hello";
    self.builderVal = beginCell();
    self.addrVal = myAddress();
  }
}
