contract MinimalPrimitives {
    intVar: Int = 1;
    boolVar: Bool = true;
    addrVar: Address;      // no default
    cellVar: Cell;         // no default
    sliceVar: Slice;       // no default
    builderVar: Builder;   // no default
    stringVar: String;     // no default

    init() {
        self.addrVar = myAddress();
        self.cellVar = emptyCell();
        self.sliceVar = emptyCell().asSlice();
        self.builderVar = beginCell();
        self.stringVar = "hi";
    }
}
