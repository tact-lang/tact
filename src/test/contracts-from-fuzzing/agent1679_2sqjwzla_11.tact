contract SerialFormat {
    numSigned: Int as int64;
    numUnsigned: Int as uint32;
    bigInt: Int as int257;

    init() {
        self.numSigned = -123456;
        self.numUnsigned = 123456;
        self.bigInt = 1234567890123456789;
    }
}