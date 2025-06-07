contract OptionalSliceZero {
    s: Slice? = null;

    init() {
        self.s = emptyCell().asSlice();
    }
}