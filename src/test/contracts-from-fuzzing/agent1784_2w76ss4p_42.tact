struct OptionalSliceCell {
    s: Slice?;
    c: Cell?;
}

contract OptSliceCell {
    x: OptionalSliceCell;

    init() {
        self.x = OptionalSliceCell{ s: null, c: null };
    }
}