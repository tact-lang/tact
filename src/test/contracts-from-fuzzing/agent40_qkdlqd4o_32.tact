contract MultiTypes {
    ival: Int;
    bval: Bool;
    sval: String;
    aval: Address;
    cval: Cell;
    slval: Slice;
    bldval: Builder;

    init() {
        self.ival = 123;
        self.bval = true;
        self.sval = "hello!";
        self.aval = myAddress();
        self.cval = emptyCell();
        self.slval = emptyCell().asSlice();
        self.bldval = beginCell();
    }
}