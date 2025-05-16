contract OnlySlices {
    sl1: Slice;
    sl2: Slice;
    init() {
        self.sl1 = emptySlice();
        self.sl2 = emptySlice();
    }
}