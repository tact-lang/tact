contract VarSizes {
    tiny: Int as uint4 = 0;
    small: Int as int8 = 0;
    med: Int as uint16 = 0;
    large: Int as int64 = 0;
    huge: Int = 0;

    init() {
        self.tiny = 7;
        self.small = -8;
        self.med = 1234;
        self.large = 56789;
        self.huge = -987654321;
    }
}