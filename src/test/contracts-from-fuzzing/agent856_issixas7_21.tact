contract StringsAndSlices {
    s: String;
    sl: Slice;
    c: Cell;

    init() {
        self.s = "test";
        self.c = emptyCell();
        self.sl = self.c.asSlice();
    }
}