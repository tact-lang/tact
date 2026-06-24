struct OptionalSliceAndCell {
    s: Slice?;
    c: Cell?;
}

contract Test {
    data: OptionalSliceAndCell;

    init() {
        self.data = OptionalSliceAndCell{
            s: null,
            c: null
        };
    }
}