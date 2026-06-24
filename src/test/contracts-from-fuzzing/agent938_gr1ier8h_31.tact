contract SerializationEdge {
    small: Int as uint4;
    big: Int as uint256;

    init() {
        self.small = 15;
        self.big = (1 << 255) - 1;
    }
}
