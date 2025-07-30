struct HasCoin {
    amount: Int as coins;
}

contract CoinStorage {
    field: HasCoin;

    init() {
        self.field = HasCoin{amount: ton("1")};
    }
}