contract TestContract {
    i: Int;
    iOpt: Int?;
    b: Bool;
    bOpt: Bool?;
    addr: Address;
    addrOpt: Address?;
    cellField: Cell;
    cellOpt: Cell?;
    sliceField: Slice;
    sliceOpt: Slice?;
    builderField: Builder;
    builderOpt: Builder?;
    str: String;
    strOpt: String?;

    init() {
        self.i = 1;
        self.iOpt = null;
        self.b = true;
        self.bOpt = null;
        self.addr = myAddress();
        self.addrOpt = null;
        self.cellField = emptyCell();
        self.cellOpt = null;
        self.sliceField = emptyCell().asSlice();
        self.sliceOpt = null;
        self.builderField = beginCell();
        self.builderOpt = null;
        self.str = "hello";
        self.strOpt = null;
    }
}