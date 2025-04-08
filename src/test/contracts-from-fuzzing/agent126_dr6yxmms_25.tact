contract OptionalSliceCell {
    sc: Slice?;
    cc: Cell?;

    init() {
        self.sc = null;
        self.cc = null;
    }
}