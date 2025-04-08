struct OptSliceCell {
    sl: Slice?;
    cl: Cell?;
}

contract OptionalSliceCell {
    data: OptSliceCell;

    init() {
        self.data = OptSliceCell{ sl: null, cl: null };
    }
}