contract CoinVariety {
    coins1: Int as coins = 0;
    coins2: Int as coins = 1000000;
    bigCoins: Int as coins = 1000000000;

    init() {
        self.coins1 = 10;
        self.coins2 = 2000000;
        self.bigCoins = 3000000000;
    }
}