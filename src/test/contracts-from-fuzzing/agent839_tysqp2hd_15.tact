message(0x11) Token {
    sym: String;
    dec: Int;
}

struct Wallet {
    token: Token?;
    balance: Int;
    owner: Address?;
}

contract ComplexWrap {
    w: Wallet;

    init() {
        self.w = Wallet{
            token: null,
            balance: 1000,
            owner: null,
        };
    }
}