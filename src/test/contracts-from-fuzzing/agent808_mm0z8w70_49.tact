contract SliceAndString {
    s: Slice;
    t: String;

    init() {
        self.s = emptyCell().asSlice();
        self.t = "test";
    }
}