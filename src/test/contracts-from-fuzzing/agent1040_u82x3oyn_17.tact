struct HasSliceBuilderCell {
    s: Slice;
    b: Builder;
    c: Cell;
}

contract SliceBuilderCellStorage {
    data: HasSliceBuilderCell;

    init() {
        self.data = HasSliceBuilderCell {
            s: emptyCell().asSlice(),
            b: beginCell(),
            c: emptyCell(),
        };
    }
}