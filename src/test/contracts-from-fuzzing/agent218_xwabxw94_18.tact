struct CoinStruct {
    amount: Int as coins;
}

contract CoinInside {
    cs: CoinStruct;

    init() {
        self.cs = CoinStruct{ amount: ton("1.23") };
    }
}