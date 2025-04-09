struct WithBuilderSliceCell {
    b: Builder;
    s: Slice;
    c: Cell;
}

contract TestBuilderSliceCell {
    storage: WithBuilderSliceCell;

    init() {
        self.storage = WithBuilderSliceCell{
            b: beginCell(),
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}
