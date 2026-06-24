struct BoolCoinsOrder {
    f: Bool;
    amt: Int as coins;
}

contract BoolCoinsPersist {
    st: BoolCoinsOrder;

    init() {
        self.st = BoolCoinsOrder{
            f: true,
            amt: ton("100"),
        };
    }
}
