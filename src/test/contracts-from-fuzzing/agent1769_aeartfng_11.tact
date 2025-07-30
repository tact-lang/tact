contract MixedSerializations {
    bigInt: Int; // implicit int257
    smallUint: Int as uint4;
    mediumInt: Int as int64;
    largeUint: Int as uint128;

    init() {
        self.bigInt = 1000;
        self.smallUint = 7;
        self.mediumInt = -1000;
        self.largeUint = 123456789123456789;
    }
}