contract MaxSerializationSizes {
    bigInt: Int as int257;
    smallInt: Int as int1;
    bigUInt: Int as uint256;
    smallUInt: Int as uint1;

    init() {
        self.bigInt = 0;
        self.smallInt = 0;
        self.bigUInt = 0;
        self.smallUInt = 0;
    }
}