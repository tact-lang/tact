contract InitDifferentBits {
    small: Int as uint4;
    big: Int as uint64;
    huge: Int;

    init() {
        self.small = 7;
        self.big = 12345678;
        self.huge = 98765432109876543210987654321;
    }
}