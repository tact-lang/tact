struct OptionalSliceCell {
    s: Slice?;
    c: Cell?;
}

contract Test {
    osc: OptionalSliceCell;

    init() {
        self.osc = OptionalSliceCell{
            s: null,
            c: null
        };
    }
}
