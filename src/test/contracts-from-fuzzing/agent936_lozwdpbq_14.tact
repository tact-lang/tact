struct HasCoinVar {
  coins: Int as coins;
  other: Int;
}

contract TestContract {
  data: HasCoinVar;

  init() {
    self.data = HasCoinVar{
      coins: ton("1"),
      other: 5,
    };
  }
}
