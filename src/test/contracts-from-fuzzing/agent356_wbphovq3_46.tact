struct Balance {
    amount: Int as coins;
    frozen: Bool;
}

contract Balances {
    b: Balance;

    init() {
        self.b = Balance{ amount: ton("1.23"), frozen: false };
    }
}