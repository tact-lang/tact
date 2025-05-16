contract SerializationRanges {
    small: Int as uint4;
    medium: Int as uint32;
    large: Int as int257;

    init() {
        self.small = 5;
        self.medium = 100000;
        self.large = -12345678901234567890;
    }
}