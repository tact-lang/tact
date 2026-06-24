contract SerializeEdgeCase {
    largeInt: Int as uint256;
    smallInt: Int as int1;
    middleInt: Int as uint128;

    init() {
        self.largeInt = 1 << 255;
        self.smallInt = 0;
        self.middleInt = 1 << 127;
    }
}