message(42) Pay {
    amount: Int;
    comment: String?;
}

struct Wallet {
    id: Int;
    lastPayment: Pay?;
}

contract Test {
    saved: Wallet;

    init() {
        self.saved = Wallet{
            id: 1,
            lastPayment: null,
        };
    }
}