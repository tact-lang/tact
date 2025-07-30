contract VariousSerialization {
    int8field: Int as int8;
    int64field: Int as int64;
    uint4field: Int as uint4;
    uint256field: Int as uint256;
    coinsfield: Int as coins;

    init() {
        self.int8field = -5;
        self.int64field = 1234567890;
        self.uint4field = 15;
        self.uint256field = 123456789;
        self.coinsfield = 999999999;
    }
}
