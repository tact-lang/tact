contract IntSerializationTest {
    big: Int; // default int257
    smallu: Int as uint8;
    smalli: Int as int8;
    coin: Int as coins;

    init() {
        self.big = 1000000000000;
        self.smallu = 255;
        self.smalli = -128;
        self.coin = ton("1");
    }
}