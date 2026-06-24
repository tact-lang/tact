struct CellSliceBuilder {
    a: Cell;
    b: Slice;
    c: Builder;
}

contract TestCellRelatedFields {
    f: CellSliceBuilder;

    init() {
        self.f = CellSliceBuilder{
            a: emptyCell(),
            b: emptyCell().asSlice(),
            c: beginCell(),
        };
    }
}