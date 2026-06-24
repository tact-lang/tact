contract SerializationTest {
    smallInt: Int as uint8;
    largeInt: Int;
    negInt: Int as int16;

    init() {
        self.smallInt = 255;
        self.largeInt = 1234567890123456789;
        self.negInt = -12345;
    }
}