struct OptionalSliceCell {
    s: Slice?;
    c: Cell?;
}

contract OptSliceCell {
    data: OptionalSliceCell;

    init() {
        self.data = OptionalSliceCell{ s: null, c: null };
    }
}