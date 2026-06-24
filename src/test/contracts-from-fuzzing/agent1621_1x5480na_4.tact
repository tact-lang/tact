contract MixedTypes {
  intVal: Int;
  boolVal: Bool;
  optInt: Int?;
  optBool: Bool?;
  addr: Address;
  str: String;
  cellVal: Cell;
  sliceVal: Slice;
  builderVal: Builder;

  init() {
    self.intVal = 1;
    self.boolVal = true;
    self.optInt = null;
    self.optBool = false;
    self.addr = myAddress();
    self.str = "hi";
    self.cellVal = emptyCell();
    self.sliceVal = emptyCell().asSlice();
    self.builderVal = beginCell();
  }
}