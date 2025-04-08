contract IntFieldWithSerialization {
    small: Int as uint8;
    large: Int as int256;
    coinVal: Int as coins;

    init() {
        self.small = 200;
        self.large = 1000000000;
        self.coinVal = ton("1");
    }
}
