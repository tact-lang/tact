contract MultiFields {
    ivar: Int;
    svar: String;
    bvar: Bool;
    cellvar: Cell;
    slicevar: Slice;
    buildervar: Builder;
    addressvar: Address;

    init() {
        self.ivar = 1;
        self.svar = "abc";
        self.bvar = false;
        self.cellvar = emptyCell();
        self.slicevar = emptyCell().asSlice();
        self.buildervar = beginCell();
        self.addressvar = myAddress();
    }
}