struct IntAsCoins {
    c1: Int as coins;
    c2: Int as coins;
}

contract CoinAmounts {
    data: IntAsCoins;

    init() {
        self.data = IntAsCoins{
            c1: 0,
            c2: 100,
        };
    }
}