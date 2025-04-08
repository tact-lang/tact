contract StringAndSlices {
    s: String;
    sl: Slice;

    init() {
        self.s = "abc";
        self.sl = emptyCell().asSlice();
    }
}