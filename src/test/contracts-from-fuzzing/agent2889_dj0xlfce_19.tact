contract SerializeIntSizes {
    tiny: Int as uint1;
    small: Int as uint4;
    medium: Int as uint8;
    large: Int as uint32;

    init() {
        self.tiny = 1;
        self.small = 5;
        self.medium = 127;
        self.large = 123456;
    }
}