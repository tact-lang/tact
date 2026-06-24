contract SliceCellAddress {
    s: Slice;
    c: Cell;
    a: Address;

    init() {
        self.s=emptyCell().asSlice();
        self.c=emptyCell();
        self.a=myAddress();
    }
}