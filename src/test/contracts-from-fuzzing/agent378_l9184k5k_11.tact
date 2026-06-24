contract IntSerializationTest {
    small: Int as int8;
    large: Int;

    init() {
        self.small = 127;
        self.large = 123456789;
    }
}