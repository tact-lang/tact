contract IntSerialization {
    big: Int;
    small: Int as uint8;
    signed: Int as int8;

    init() {
        self.big = 1000000;
        self.small = 255;
        self.signed = -128;
    }
}
