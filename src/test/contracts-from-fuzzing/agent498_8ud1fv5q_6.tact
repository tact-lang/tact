contract SliceRequiredField {
    s: Slice;
    init() {
        self.s = emptyCell().asSlice();
    }
}