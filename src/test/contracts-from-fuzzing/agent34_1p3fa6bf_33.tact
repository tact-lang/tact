contract Test32 {
    s: Slice;
    init() {
        self.s = "abc".asComment().asSlice();
    }
}