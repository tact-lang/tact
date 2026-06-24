struct AddrSliceCell {
    a: Address;
    s: Slice;
    c: Cell;
}

contract AddrSliceCellContract {
    data: AddrSliceCell;

    init() {
        self.data = AddrSliceCell{
            a: myAddress(),
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}