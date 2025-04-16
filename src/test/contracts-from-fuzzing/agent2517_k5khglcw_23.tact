struct WalletData {
  balance: Int as coins;
  reserved: Int as coins;
  comment: String?;
}

contract Test {
  wd: WalletData;

  init() {
    self.wd = WalletData{
      balance: 1000,
      reserved: 100,
      comment: null,
    };
  }
}