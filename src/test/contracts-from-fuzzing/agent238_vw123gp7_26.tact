struct CoinStruct {
    big: Int as coins;
    small: Int?
}

contract CoinsTest {
    data: CoinStruct;

    init() {
        self.data = CoinStruct{
            big: 1000000000,
            small: null
        };
    }
}