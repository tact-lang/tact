struct OptSliceCell {
    a: Slice?;
    b: Cell?;
}

contract OptionalSliceCellTest {
    s: OptSliceCell;

    init() {
        self.s = OptSliceCell{
            a: null,
            b: null,
        };
    }
}