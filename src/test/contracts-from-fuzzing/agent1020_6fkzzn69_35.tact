contract LargeMix {
  a: Int = 1;
  b: Bool = false;
  s: String = "s";
  optI: Int?;
  optB: Bool?;
  optS: String?;
  addr: Address;
  cellF: Cell;

  init() {
    self.optI = null;
    self.optB = null;
    self.optS = null;
    self.addr = myAddress();
    self.cellF = emptyCell();
  }
}
