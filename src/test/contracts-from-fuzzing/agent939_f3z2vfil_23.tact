struct CoinWrap {
    amount: Int as coins;
}

struct Holder {
    wrapped: CoinWrap?;
}

contract TestContract {
    stored: Holder;

    init() {
        self.stored = Holder{ wrapped: null };
    }
}