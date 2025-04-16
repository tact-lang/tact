contract IntWidths {
    small: Int as int4;
    medium: Int as int32;
    big: Int as int256;

    init() {
        self.small = -5;
        self.medium = -100000;
        self.big = -12345678901234567890;
    }
}