contract DifferentSerializations {
    fullInt: Int;
    shortUInt: Int as uint3;
    smallInt: Int as int8;
    coinVal: Int as coins;

    init() {
        self.fullInt = 1;
        self.shortUInt = 3;
        self.smallInt = -4;
        self.coinVal = 42;
    }
}
