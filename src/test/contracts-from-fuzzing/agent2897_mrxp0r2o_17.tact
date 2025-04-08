contract CoinTypes {
    coins1: Int as coins;
    coins2: Int as coins;
    init() {
        self.coins1 = 1000000000; // 1 ton
        self.coins2 = 500000000;  // 0.5 ton
    }
}