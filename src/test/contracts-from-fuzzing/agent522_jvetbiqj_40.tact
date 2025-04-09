contract ContractWithUintFormats {
    num8: Int as uint8;
    num32: Int as uint32;
    num64: Int as uint64;

    init() {
        self.num8 = 1;
        self.num32 = 1000;
        self.num64 = 100000;
    }
}