struct Wallet {
  balance: Int;
}

message Pay {
  amount: Int;
}

contract Test {
  receive() {
    let w = Wallet { balance: 100 };
    let p = Pay { amount: 10 };
    w.balance = w.balance - p.amount;
  }
}