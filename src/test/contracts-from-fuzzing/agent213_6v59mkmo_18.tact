contract Contr {
    v1: Int as uint8;
    v2: Int as uint16;
    v3: Int as int32;
    v4: Int as int64;
    v5: Int as uint256;

    init() {
        self.v1 = 1;
        self.v2 = 2;
        self.v3 = 3;
        self.v4 = 4;
        self.v5 = 5;
    }
}