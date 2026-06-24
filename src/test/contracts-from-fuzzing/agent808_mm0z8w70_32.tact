struct SingleValue {
    amount: Int as coins;
}

contract CoinStorage {
    balance: SingleValue;

    init() {
        self.balance = SingleValue{ amount: ton("5") };
    }
}