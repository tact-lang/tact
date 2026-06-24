contract SliceTest {
    s: Slice;

    init() {
        self.s = emptyCell().asSlice();
    }
}
