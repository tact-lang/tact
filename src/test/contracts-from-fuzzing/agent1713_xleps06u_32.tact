contract OverlappingIntSizes {
    big: Int as uint256;
    small: Int as uint8;

    init() {
        self.big = (1 << 255);
        self.small = 255;
    }
}