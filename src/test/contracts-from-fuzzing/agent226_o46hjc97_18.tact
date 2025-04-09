struct OptionalSliceCell {
    c: Cell?;
    s: Slice?;
}

contract TestOptCellsSlices {
    state: OptionalSliceCell;

    init() {
        self.state = OptionalSliceCell {
            c: null,
            s: null
        };
    }
}
