contract MixedSizes {
    bigInt: Int;
    tinyInt: Int as uint1;
    smallInt: Int as int8;
    midInt: Int as int32;
    bigUInt: Int as uint256;

    init() {
        self.bigInt = 1;
        self.tinyInt = 1;
        self.smallInt = 2;
        self.midInt = 3;
        self.bigUInt = 4;
    }

    receive() {
        self.bigInt += 1;
    }
}