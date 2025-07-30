contract OptionalSliceCellString {
    s: Slice?;
    c: Cell?;
    str: String?;

    init() {
        self.s = null;
        self.c = null;
        self.str = null;
    }
}