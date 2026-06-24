contract CoinsPersisted {
    balance: Int as coins;

    init() {
        self.balance = ton("1");
    }
}