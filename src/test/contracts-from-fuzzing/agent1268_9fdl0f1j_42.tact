// Optional slice+cell init null
contract NullOptCells {
    s: Slice?;
    c: Cell?;

    init() {
        self.s = null;
        self.c = null;
    }
}