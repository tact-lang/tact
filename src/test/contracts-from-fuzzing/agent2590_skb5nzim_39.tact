struct OptionalSliceCell {
    s: Slice?;
    c: Cell?;
}

contract OptionSliceCellContract {
    foo: OptionalSliceCell;
    init() {
        self.foo = OptionalSliceCell{ s: null, c: null };
    }
}