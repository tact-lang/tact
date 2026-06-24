struct CoinStruct {
    amount: Int as coins;
    optionalAmount: Int?; 
    deposit: Int as coins;
}

contract CoinPersist {
    balance: CoinStruct;

    init() {
        self.balance = CoinStruct{
            amount: ton("1.5"),
            optionalAmount: null,
            deposit: ton("2"),
        };
    }

    receive() {}
}