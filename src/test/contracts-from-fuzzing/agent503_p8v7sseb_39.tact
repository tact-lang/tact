struct CoinVals {
  balance: Int as coins;
  amount: Int as coins;
}

contract CoinPersistent {
  vals: CoinVals;

  init() {
    self.vals = CoinVals{ balance: ton("1"), amount: 123456789 };
  }
}
