struct HasCoin {
    amount: Int as coins;
}

contract OptionalCoinsStruct {
    c: HasCoin?;

    init() {
        self.c = null;
    }
}