contract CoinTypes {
    coins1: Int as coins;
    coins2: Int as coins;

    init() {
        self.coins1 = ton("0.2");
        self.coins2 = ton("5");
    }
}