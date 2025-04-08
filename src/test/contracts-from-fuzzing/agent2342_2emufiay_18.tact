struct CellAndSlice {
    c: Cell;
    s: Slice;
}

contract CellSliceContract {
    payloads: CellAndSlice;

    init() {
        self.payloads = CellAndSlice{
            c: emptyCell(),
            s: emptyCell().asSlice()
        };
    }
}