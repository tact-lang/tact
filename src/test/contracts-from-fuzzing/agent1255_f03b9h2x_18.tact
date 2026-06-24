struct Wallet {
    balance: Int as coins;
    reserve: Int as coins;
}

contract Test18 {
    data: Wallet;

    init() {
        self.data = Wallet{
            balance: 0,
            reserve: 0,
        };
    }
}