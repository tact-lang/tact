contract SerializeAsInt {
    small: Int as uint8;
    neg: Int as int16;

    init() {
        self.small = 255;
        self.neg = -1000;
    }
}
