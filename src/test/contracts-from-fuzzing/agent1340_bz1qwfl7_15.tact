struct CellSliceBuilder {
    c: Cell;
    s: Slice;
    b: Builder;
}

contract CellRelatedFields {
    csb: CellSliceBuilder;

    init() {
        self.csb = CellSliceBuilder{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            b: beginCell(),
        };
    }
}