contract MultiIntSizes {
    i8: Int as uint8 = 0;
    i16: Int as uint16 = 0;
    i32: Int as uint32 = 0;
    i64: Int as uint64 = 0;
    i128: Int as uint128 = 0;
    i256: Int as uint256 = 0;

    init() {
        self.i8 = 1;
    }
}