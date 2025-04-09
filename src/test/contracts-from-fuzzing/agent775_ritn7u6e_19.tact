contract SerializationTest {
    smallUInt: Int as uint8 = 255;
    smallSInt: Int as int16 = -32768;
    largeDefault: Int = 123456789;

    init() {
        self.smallUInt = 100;
        self.smallSInt = -1234;
        self.largeDefault = 987654321;
    }
}