contract MaxUIntSizeTest {
    small: Int as uint1;
    large: Int as uint256;

    init() {
        self.small = 1;
        self.large = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    }
}