contract TestSliceGetter {
    s: Slice;

    init() {
        self.s = rawSlice("20a03f");
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.s;
    }
}
