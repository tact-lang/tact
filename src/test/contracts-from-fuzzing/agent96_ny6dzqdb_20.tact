struct OptSliceCell {
    s: Slice?;
    c: Cell?;
}

contract Test {
    d: OptSliceCell;

    init() {
        self.d = OptSliceCell{ s: null, c: null };
    }
}