struct WithCoin {
    amount: Int as coins;
}

contract CoinStructTest {
    foo: WithCoin;

    init() {
        self.foo = WithCoin{
            amount: ton("1")
        };
    }
}
