struct StructWithCoins {
    amount: Int as coins;
}

contract CoinsSerializationTest {
    s: StructWithCoins;

    init() {
        self.s = StructWithCoins{
            amount: ton("1")
        };
    }
}