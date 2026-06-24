contract MultipleSlices {
    a: Slice;
    b: Slice;

    init() {
        self.a = emptyCell().asSlice();
        self.b = emptyCell().asSlice();
    }
}