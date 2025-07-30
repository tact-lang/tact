contract EdgeInts {
    small: Int as int4;
    large: Int as uint256;

    init() {
        self.small = 7;
        self.large = 123456789;
    }
}