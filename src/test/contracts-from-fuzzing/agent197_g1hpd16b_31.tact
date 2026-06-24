struct CoinField { amt: Int as coins = ton("1"); }

contract CoinPersist {
    c: CoinField = CoinField{ amt: ton("1") };
}