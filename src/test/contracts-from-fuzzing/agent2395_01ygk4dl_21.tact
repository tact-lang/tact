contract IntWithManyWidths {
    normalInt: Int;
    int8: Int as int8;
    uint16: Int as uint16;
    int64: Int as int64;
    uint256: Int as uint256;

    init() {
        self.normalInt = 1;
        self.int8 = 2;
        self.uint16 = 3;
        self.int64 = 4;
        self.uint256 = 5;
    }
}
