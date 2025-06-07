struct Money {
    amount: Int as coins;
}

contract TestContract {
    balance: Money = Money{ amount: 0 };

    receive() {
        let _ = self.balance.amount;
    }
}