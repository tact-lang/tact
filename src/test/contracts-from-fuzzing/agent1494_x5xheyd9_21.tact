contract TypeSerialization {
    i64: Int as int64;
    u32: Int as uint32;
    coinsVal: Int as coins;
    defaultInt: Int;

    init() {
        self.i64 = 42;
        self.u32 = 999;
        self.coinsVal = 1_000_000_000;
        self.defaultInt = -123456789;
    }
}
