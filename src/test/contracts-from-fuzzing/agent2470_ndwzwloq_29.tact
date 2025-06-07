struct CellSliceAddr {
    c: Cell;
    s: Slice;
    a: Address;
}

contract CSA {
    data: CellSliceAddr;

    init() {
        self.data = CellSliceAddr{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            a: myAddress(),
        };
    }
}