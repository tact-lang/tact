contract SerializationChecks {
    si: Int as int64;
    ui: Int as uint32;
    coinsField: Int as coins;
    sliceRem: Slice as remaining;
    
    init() {
        self.si = -100;
        self.ui = 1234;
        self.coinsField = ton("1");
        self.sliceRem = emptyCell().asSlice();
    }
}