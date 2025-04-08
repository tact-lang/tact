contract TestContract {
    tinyInt: Int as uint4;
    smallInt: Int as int8;
    mediumInt: Int as uint16;
    bigInt: Int as int32;
    hugeInt: Int;

    init() {
        self.tinyInt = 3;
        self.smallInt = -7;
        self.mediumInt = 256;
        self.bigInt = -100000;
        self.hugeInt = 1234567890123456789;
    }
}
