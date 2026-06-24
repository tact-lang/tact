contract OnlySliceAndAddress {
    s: Slice;
    a: Address;
    sOpt: Slice?;
    aOpt: Address?;

    init() {
        self.s = emptyCell().asSlice();
        self.a = myAddress();
        self.sOpt = null;
        self.aOpt = null;
    }
}