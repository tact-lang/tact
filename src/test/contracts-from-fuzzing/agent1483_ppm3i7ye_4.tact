contract ManyDifferentTypes {
    num: Int;
    boolean: Bool;
    addr: Address;
    sliceField: Slice;
    builderField: Builder;
    cellField: Cell;
    strField: String;

    init() {
        self.num = 1;
        self.boolean = false;
        self.addr = myAddress();
        self.sliceField = emptyCell().asSlice();
        self.builderField = beginCell();
        self.cellField = emptyCell();
        self.strField = "test";
    }
}