contract AllPrimitives {
    intF: Int;
    boolF: Bool;
    stringF: String;
    cellF: Cell;
    sliceF: Slice;
    addrF: Address;

    init() {
        self.intF = 1;
        self.boolF = true;
        self.stringF = "s";
        self.cellF = emptyCell();
        self.sliceF = emptyCell().asSlice();
        self.addrF = myAddress();
    }
}