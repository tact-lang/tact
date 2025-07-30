contract UseUintSerialization {
    normal: Int;
    u16: Int as uint16;
    u128: Int as uint128;
    i64: Int as int64;
    init() {
        self.normal = 1;
        self.u16 = 2;
        self.u128 = 3;
        self.i64 = -4;
    }
}