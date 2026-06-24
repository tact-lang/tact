contract Test {
  coinsVal: Int as coins;
  coinsOpt: Int as coins;

  init() {
    self.coinsVal = 100;
    self.coinsOpt = 0;
  }
}