contract ManyPrimitiveTypes {
  intVal: Int = 0;
  boolVal: Bool = true;
  addrVal: Address;
  cellVal: Cell;
  sliceVal: Slice;
  builderVal: Builder;
  strVal: String = "test";

  init() {
    self.intVal = 1;
    self.boolVal = false;
    self.addrVal = myAddress();
    self.cellVal = emptyCell();
    self.sliceVal = emptyCell().asSlice();
    self.builderVal = beginCell();
    self.strVal = "done";
  }
}