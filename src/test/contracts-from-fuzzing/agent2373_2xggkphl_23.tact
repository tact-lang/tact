struct OptionalSliceCell {
    s: Slice?;
    c: Cell?;
}

contract SliceCellOptional {
    data: OptionalSliceCell;

    init() {
        self.data = OptionalSliceCell{ s: null, c: null };
    }
}