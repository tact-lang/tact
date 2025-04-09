struct Balance {
    coins: Int as coins;
    points: Int as uint32;
}

contract CoinTypes {
    balance: Balance;

    init() {
        self.balance = Balance{
            coins: 1000,
            points: 42
        };
    }
}