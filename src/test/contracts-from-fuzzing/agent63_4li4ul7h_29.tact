contract MaxIntSerialization {
    small: Int as uint8;
    medium: Int as uint16;
    large: Int as uint64;
    biggest: Int;

    init() {
        self.small = 255;
        self.medium = 65535;
        self.large = 18446744073709551615;
        self.biggest = 123456789012345678901234567890;
    }
}
