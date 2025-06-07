struct Wallet {
    balance: Int as coins;
}

contract TestContract {
    w: Wallet;

    init() {
        self.w = Wallet{ balance: 1000000000 };
    }
}
