contract VariousSerializations {
    int64field: Int as int64;
    uint32field: Int as uint32;
    coinsfield: Int as coins;
    defaultInt: Int;

    init() {
        self.int64field = 1;
        self.uint32field = 2;
        self.coinsfield = ton("1");
        self.defaultInt = 42;
    }
}