contract BoolAndIntVariants {
    valueInt: Int as int16;
    valueUInt: Int as uint32;
    valueCoins: Int as coins;
    flag: Bool;

    init() {
        self.valueInt = -1234;
        self.valueUInt = 123456;
        self.valueCoins = 1000000;
        self.flag = true;
    }
}