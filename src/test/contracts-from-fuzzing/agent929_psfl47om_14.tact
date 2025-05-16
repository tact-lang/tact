contract SerializationTest {
    smallInt: Int as uint8;
    negInt: Int as int8;
    bigInt: Int = 1000000;

    init() {
        self.smallInt = 255;
        self.negInt = -128;
        self.bigInt = 1000000;
    }
}