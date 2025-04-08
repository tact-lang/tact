contract SliceInitTest {
    s: Slice;
    init() {
        self.s = emptyCell().asSlice();
    }
}