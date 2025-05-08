contract SliceFields {
    a: Slice;
    b: Slice;
    c: Slice;

    init() {
        self.a = emptyCell().asSlice();
        self.b = emptyCell().asSlice();
        self.c = emptyCell().asSlice();
    }
}