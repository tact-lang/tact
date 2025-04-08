contract TestContract {
    tiny: Int as uint1 = 0;
    small: Int as uint4 = 0;
    big: Int as int256 = 0;
    huge: Int as int257 = 0;

    init() {
        self.tiny = 1;
        self.small = 5;
        self.big = 123456789;
        self.huge = -987654321;
    }
}
