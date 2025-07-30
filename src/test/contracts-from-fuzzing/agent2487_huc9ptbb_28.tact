contract AllPrimitiveSizes {
    small: Int as uint8;
    medium: Int as int32;
    large: Int as uint128;
    huge: Int as int257;

    init() {
        self.small = 1;
        self.medium = -1000;
        self.large = 123456789012345;
        self.huge = -1;
    }
}