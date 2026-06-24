contract EdgeSerialization {
    i64: Int as int64;
    u4: Int as uint4;
    u128: Int as uint128;
    def: Int;

    init() {
        self.i64 = 0;
        self.u4 = 0;
        self.u128 = 0;
        self.def = 0;
    }
}