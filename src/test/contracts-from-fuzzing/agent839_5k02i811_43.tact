contract Borders {
    int8v: Int as int8;
    int16v: Int as int16;
    int32v: Int as int32;
    int64v: Int as int64;
    int128v: Int as int128;
    int256v: Int as int256;
    uint8v: Int as uint8;
    uint16v: Int as uint16;
    uint32v: Int as uint32;
    uint64v: Int as uint64;
    uint128v: Int as uint128;
    uint256v: Int as uint256;
    init() {
        self.int8v = -128;
        self.int16v = -32768;
        self.int32v = -2147483648;
        self.int64v = -9223372036854775808;
        self.int128v = -170141183460469231731687303715884105728;
        self.int256v = -57896044618658097711785492504343953926634992332820282019728792003956564819968;
        self.uint8v = 0;
        self.uint16v = 0;
        self.uint32v = 0;
        self.uint64v = 0;
        self.uint128v = 0;
        self.uint256v = 0;
    }
}