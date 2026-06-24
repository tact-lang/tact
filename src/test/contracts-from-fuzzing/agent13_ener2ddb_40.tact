contract SerializationMaxBits {
    small: Int as uint8;
    large: Int as int257;

    init() {
        self.small = 255;
        self.large = -1;
    }
}