contract IntSerializationRange {
    small: Int as uint8;
    big: Int as int256;

    init() {
        self.small = 255;
        self.big = -123456789;
    }
}
