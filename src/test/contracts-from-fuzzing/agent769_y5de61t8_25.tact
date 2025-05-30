contract CoinTypes {
  amount: Int as coins;
  small: Int as uint4;
  tiny: Int as uint1;

  init() {
    self.amount = ton("1");
    self.small = 3;
    self.tiny = 1;
  }
}