struct OptionalSliceCell {
    s: Slice?;
    c: Cell?;
}

contract OptionalSlices {
    v: OptionalSliceCell;
    init() {
        self.v = OptionalSliceCell{
            s: null,
            c: emptyCell()
        };
    }
}