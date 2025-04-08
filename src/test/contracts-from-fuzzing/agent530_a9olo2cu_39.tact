struct WithCoin {
    val: Int as coins;
}

contract CoinTest {
    v: WithCoin;

    init() {
        self.v = WithCoin{ val: ton("1") };
    }
}
