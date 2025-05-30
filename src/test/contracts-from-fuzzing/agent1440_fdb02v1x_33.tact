struct OptionalSliceCell {
    s: Slice?;
    c: Cell?;
}

contract OptSliceCellTest {
    val: OptionalSliceCell;

    init() {
        self.val = OptionalSliceCell{
            s: null,
            c: emptyCell()
        };
    }
}