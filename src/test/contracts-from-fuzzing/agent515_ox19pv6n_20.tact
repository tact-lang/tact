struct Wallet {
  balance: Int as coins = 0;
}

contract Test {
  w: Wallet = Wallet{};

  receive() {
    let _ = self.w.balance;
  }
}