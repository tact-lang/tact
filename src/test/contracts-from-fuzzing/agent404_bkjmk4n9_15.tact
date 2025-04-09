contract SliceInInit {
    s: Slice;

    init() {
        self.s = emptyCell().asSlice();
    }
}