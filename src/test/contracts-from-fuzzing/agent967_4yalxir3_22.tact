struct OptSliceCell {
    s: Slice?;
    c: Cell?;
}

contract OptSliceCellPersist {
    data: OptSliceCell;

    init() {
        self.data = OptSliceCell{
            s: null,
            c: null
        };
    }
}