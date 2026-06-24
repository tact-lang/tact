struct OptionalSliceCell {
    s: Slice?;
    c: Cell?;
}

contract OptionalSliceCellStorage {
    data: OptionalSliceCell;

    init() {
        self.data = OptionalSliceCell{ s: null, c: null };
    }
}