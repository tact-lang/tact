contract DifferentPrimitiveSerialization {
    small: Int as uint8;
    large: Int as int257;
    neg: Int as int16;

    init() {
        self.small = 255;
        self.large = 100000000000;
        self.neg = -12345;
    }
}