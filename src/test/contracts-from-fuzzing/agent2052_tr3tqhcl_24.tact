contract MixedSizeIntTest {
    bigInt: Int;
    smallInt: Int as uint8;
    medInt: Int as uint32;

    init() {
        self.bigInt = 123456789;
        self.smallInt = 255;
        self.medInt = 65535;
    }
}