contract UIntWidths {
    small: Int as uint4;
    medium: Int as uint32;
    big: Int as uint256;

    init() {
        self.small = 5;
        self.medium = 100000;
        self.big = 12345678901234567890;
    }
}