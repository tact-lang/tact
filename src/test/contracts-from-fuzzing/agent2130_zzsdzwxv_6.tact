contract Test {
    small: Int as int4 = 3;
    largeUnsigned: Int as uint8 = 255;

    init() {
        self.small = -2;
        self.largeUnsigned = 42;
    }
}