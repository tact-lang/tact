contract BigInts {
    int8: Int as int8;
    uint8: Int as uint8;
    int16: Int as int16;
    uint16: Int as uint16;
    int32: Int as int32;
    uint32: Int as uint32;
    int64: Int as int64;
    uint64: Int as uint64;
    int128: Int as int128;
    uint128: Int as uint128;
    int256: Int as int256;
    uint256: Int as uint256;

    init() {
        self.int8 = 1;
        self.uint8 = 1;
        self.int16 = 2;
        self.uint16 = 2;
        self.int32 = 3;
        self.uint32 = 3;
        self.int64 = 4;
        self.uint64 = 4;
        self.int128 = 5;
        self.uint128 = 5;
        self.int256 = 6;
        self.uint256 = 6;
    }
}