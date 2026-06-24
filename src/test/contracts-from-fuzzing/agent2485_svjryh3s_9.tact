contract DefaultSerialization {
    big: Int = 123;
    smallUnsigned: Int as uint8 = 7;
    smallSigned: Int as int8 = -5;

    init() {
        self.big = 321;
        self.smallUnsigned = 8;
        self.smallSigned = -4;
    }
}