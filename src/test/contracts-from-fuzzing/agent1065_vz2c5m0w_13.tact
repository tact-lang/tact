struct WithSliceCell {
    data: Cell;
    view: Slice;
}

contract CellSliceStorage {
    store: WithSliceCell;

    init() {
        self.store = WithSliceCell{
            data: emptyCell(),
            view: emptyCell().asSlice(),
        };
    }
}
