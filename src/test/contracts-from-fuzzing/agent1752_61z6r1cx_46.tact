contract StateOrderOverflowTest {
    small: Int as uint8;
    large: Int;
    negSmall: Int as int8;

    init() {
        self.small = 255;
        self.large = -1;
        self.negSmall = -128;
    }
}