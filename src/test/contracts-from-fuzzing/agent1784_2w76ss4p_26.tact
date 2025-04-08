struct StructWithCoins {
    val: Int as coins;
}

contract CoinsContract {
    rec: StructWithCoins;

    init() {
        self.rec = StructWithCoins{ val: ton("1") };
    }
}