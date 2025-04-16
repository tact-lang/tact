// Contract using optional empty string and zero address
contract ZeroesAndNulls {
  optStr: String?;
  optAddr: Address?;

  init() {
    self.optStr = null;
    self.optAddr = null;
  }
}
