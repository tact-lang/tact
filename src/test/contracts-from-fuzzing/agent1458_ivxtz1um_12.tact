contract OverlappingSerialization {
    smallInt: Int as uint8;
    bigInt: Int as int257;

    init() {
        self.smallInt = 10;
        self.bigInt = 123456789;
    }
}