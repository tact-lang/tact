// Optional slice and cell fields
contract SliceCellOpts {
    s: Slice?;
    c: Cell?;
    init() {
        self.s = null;
        self.c = null;
    }
}