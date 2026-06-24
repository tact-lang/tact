contract OnlySliceField {
    sl: Slice;

    init() {
        self.sl = emptyCell().asSlice();
    }
}