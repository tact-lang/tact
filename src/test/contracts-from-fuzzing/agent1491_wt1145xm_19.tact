contract IntAsCoins {
    amount: Int as coins;

    init() {
        self.amount = ton("1");
    }
}