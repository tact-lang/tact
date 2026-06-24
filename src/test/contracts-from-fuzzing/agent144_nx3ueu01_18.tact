struct WithSliceBuilderCell {
    s: Slice;
    b: Builder;
    c: Cell;
}

contract WithCompositeTypes {
    val: WithSliceBuilderCell;

    init() {
        self.val = WithSliceBuilderCell{
            s: emptyCell().asSlice(),
            b: beginCell(),
            c: emptyCell()
        };
    }
}
