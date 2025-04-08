contract IntAsUnsigned {
    small: Int as uint4;
    big: Int as uint64;

    init() {
        self.small = 15;
        self.big = 18446744073709551615;
    }
}