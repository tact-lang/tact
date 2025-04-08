contract Test {
    big1: Int as uint8 = 255;
    big2: Int as uint64 = 18446744073709551615;
    small: Int as int4 = -8;

    init() {
        self.big1 = 0;
        self.big2 = 1;
        self.small = 7;
    }

    receive() {}
}