struct Wallet {
    balance: Int as coins;
}

struct User {
    name: String;
    wallet: Wallet?;
}

contract TestContract {
    data: User = User{ name: "x", wallet: null };

    init() {
        self.data = User{ name: "y", wallet: Wallet{ balance: ton("1") } };
    }
}