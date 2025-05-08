contract CoinTypes {
    bal: Int as coins;
    val: Int as uint64;
    init() {
        self.bal = ton("1");
        self.val = 100;
    }
}