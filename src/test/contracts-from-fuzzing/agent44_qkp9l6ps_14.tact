struct OptionalSliceCell {
    s: Slice?;
    c: Cell?;
}

contract OptionalSliceCellTest {
    data: OptionalSliceCell;

    init() {
        self.data = OptionalSliceCell{
            s: null,
            c: null,
        };
    }
}