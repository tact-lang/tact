contract VariedSerializationStorage {
    small: Int as uint8;
    middle: Int as int32;
    big: Int as int257;
    coinsVal: Int as coins;
    booleanFlag: Bool;

    init() {
        self.small = 7;
        self.middle = -123456;
        self.big = 123456789123456789;
        self.coinsVal = 1000000;
        self.booleanFlag = true;
    }
}