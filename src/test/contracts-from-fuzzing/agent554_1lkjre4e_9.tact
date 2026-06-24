contract ComplexLowLevel {
    s: String;
    c: Cell;
    slFull: Slice;
    sOpt: String?;
    cOpt: Cell?;
    slOpt: Slice?;

    init() {
        self.s = "testing";
        self.c = emptyCell();
        self.slFull = self.c.asSlice();
        self.sOpt = null;
        self.cOpt = emptyCell();
        self.slOpt = null;
    }
}