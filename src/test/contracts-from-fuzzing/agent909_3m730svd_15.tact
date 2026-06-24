contract SerializationEdges {
    tiny: Int as int1;
    huge: Int as uint256;

    init() {
        self.tiny = 1;
        self.huge = 123456789;
    }
}