contract Test {
    bigInt: Int as uint256;
    smallInt: Int as uint8;
    mediumInt: Int as int16;

    init() {
        self.bigInt = 10000000000;
        self.smallInt = 255;
        self.mediumInt = -32768;
    }
}