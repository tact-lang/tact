contract IntSerialization {
    small: Int as uint8;
    large: Int as uint256;
    signedSmall: Int as int8;

    init() {
        self.small = 255;
        self.large = 1 << 255;
        self.signedSmall = -128;
    }
}
