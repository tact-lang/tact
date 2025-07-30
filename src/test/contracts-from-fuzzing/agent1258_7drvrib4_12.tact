contract SerializationStress {
    small: Int as uint8;
    medium: Int as int64;
    big: Int as int256;

    init() {
        self.small = 128;    // Out of uint8 range intentionally
        self.medium = 9223372036854775807;
        self.big = 0;
    }
}