struct OptionalSliceCell {
    sliceOpt: Slice?;
    cellOpt: Cell?;
}

contract OptSliceCellTest {
    data: OptionalSliceCell;

    init() {
        self.data = OptionalSliceCell{ sliceOpt: null, cellOpt: null };
    }
}