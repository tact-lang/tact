struct CellAndSlice {
    a: Cell;
    b: Slice;
}

contract CellSliceFields {
    f: CellAndSlice;

    init() {
        self.f = CellAndSlice{
            a: emptyCell(),
            b: emptyCell().asSlice()
        };
    }
}