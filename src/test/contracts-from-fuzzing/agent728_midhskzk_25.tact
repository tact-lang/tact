struct CoinData {
    flag: Bool;
    amount: Int as coins;
    label: String = "unset";
}

contract CoinMix {
    state: CoinData;

    init() {
        self.state = CoinData{
            flag: true,
            amount: 1000000000
        };
    }
}