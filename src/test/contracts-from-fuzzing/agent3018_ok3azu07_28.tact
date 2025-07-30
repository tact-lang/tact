contract DifferentSerializations {
    smallInt: Int as uint8;
    mediumInt: Int as int16;
    bigInt: Int as uint64;

    init() {
        self.smallInt = 255;
        self.mediumInt = 32767;
        self.bigInt = 18446744073709551615;
    }
}
