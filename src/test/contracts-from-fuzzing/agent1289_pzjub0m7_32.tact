struct CoinStorage {
    amount1: Int as coins;
    amount2: Int as coins;
    amount3: Int as coins;
    amount4: Int as coins;
}

contract MultiCoinsPersisted {
    balances: CoinStorage;

    init() {
        self.balances = CoinStorage{
            amount1: 1000000,
            amount2: 2000000,
            amount3: 3000000,
            amount4: 4000000
        };
    }
}