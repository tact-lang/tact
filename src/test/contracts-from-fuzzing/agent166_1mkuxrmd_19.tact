message(101) Token {
    amount: Int;
}

struct Wallet {
    owner: Address;
    token: Token;
}

struct Holder {
    wallet: Wallet;
    note: String;
}

contract TestContract {
    h: Holder;

    init() {
        self.h = Holder{
            wallet: Wallet{
                owner: myAddress(),
                token: Token{ amount: 100 },
            },
            note: "hi",
        };
    }
}