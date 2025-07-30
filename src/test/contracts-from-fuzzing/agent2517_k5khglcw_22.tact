struct WalletData {
  balance: Int as coins;
  reserved: Int as coins;
}

contract Test {
  wd: WalletData;

  init() {
    self.wd = WalletData{
      balance: 1000,
      reserved: 100,
    };
  }
}