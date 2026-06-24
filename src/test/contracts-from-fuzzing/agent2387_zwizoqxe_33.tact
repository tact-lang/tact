contract IntSizes {
    small: Int as int8;
    mid: Int as int64;
    large: Int;

    init() {
        self.small = 127;
        self.mid = -123456789;
        self.large = 12345678901234567890;
    }
}