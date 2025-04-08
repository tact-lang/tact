struct CellSliceFields {
    c: Cell;
    s: Slice;
}

contract TestContract {
    data: CellSliceFields;

    init() {
        self.data = CellSliceFields{
            c: emptyCell(),
            s: emptyCell().asSlice()
        };
    }
}
