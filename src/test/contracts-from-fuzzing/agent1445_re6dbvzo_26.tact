contract LargeInts {
    bigInt: Int;
    smallInt: Int as int8;
    medInt: Int as int32;

    init() {
        self.bigInt = 1234567890123456789012345678901234;
        self.smallInt = 127;
        self.medInt = -12345;
    }
}