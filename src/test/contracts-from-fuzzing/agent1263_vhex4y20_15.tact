contract TestContract {
  optStr: String?;
  optCell: Cell?;
  optAddr: Address?;

  init() {
    self.optStr = null;
    self.optCell = null;
    self.optAddr = null;
  }
}