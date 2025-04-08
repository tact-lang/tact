contract IntSizing {
    small: Int as uint8;
    big: Int = 999999999999;
    med: Int as int16;

    init() {
        self.small = 255;
        self.big = 123456789;
        self.med = 1234;
    }
}