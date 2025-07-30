contract DefaultNormally {
  addr: Address;
  cellVal: Cell;

  init() {
    self.addr = myAddress();
    self.cellVal = emptyCell();
  }
}
