contract AllOptionalSliceCellAddr {
    s: Slice?;
    c: Cell?;
    a: Address?;

    init() {
        self.s = null;
        self.c = null;
        self.a = null;
    }
}