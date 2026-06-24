contract UIntSerialization {
    small: Int as uint8;
    med: Int as uint32;
    big: Int as uint256;

    init() {
        self.small = 1;
        self.med = 30000;
        self.big = 999999999;
    }
}