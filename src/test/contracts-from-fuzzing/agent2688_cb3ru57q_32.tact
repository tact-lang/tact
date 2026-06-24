struct WithCoins {
    coins: Int as coins;
    small: Int as uint8;
    i: Int;
}

contract CoinsStored {
    d: WithCoins;

    init() {
        self.d = WithCoins{
            coins: ton("1"),
            small: 250,
            i: 77
        };
    }
}