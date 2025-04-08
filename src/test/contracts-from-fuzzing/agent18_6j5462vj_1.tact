contract Test {
  flag: Bool;
  number: Int;
  text: String;
  sliceVal: Slice;
  builderVal: Builder;
  cellVal: Cell;
  addr: Address;

  init() {
    self.flag = true;
    self.number = 42;
    self.text = "hello";
    self.sliceVal = emptyCell().asSlice();
    self.builderVal = beginCell();
    self.cellVal = emptyCell();
    self.addr = myAddress();
  }
}