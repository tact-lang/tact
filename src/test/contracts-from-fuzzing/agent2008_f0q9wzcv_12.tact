contract OptionalSliceCellString {
    sc: Slice?;
    cl: Cell?;
    st: String?;

    init() {
        self.sc = null;
        self.cl = null;
        self.st = null;
    }
}
