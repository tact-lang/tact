contract SerializationWidths {
    tiny: Int as uint1;
    small: Int as uint4;
    medium: Int as uint32;
    large: Int as int257;

    init() {
        self.tiny = 1;
        self.small = 7;
        self.medium = 123456;
        self.large = -42;
    }
}