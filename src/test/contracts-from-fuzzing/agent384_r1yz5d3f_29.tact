contract SliceCellBuilder {
    a: Slice;
    b: Slice?;
    c: Cell;
    d: Cell?;
    e: Builder;
    f: Builder?;

    init() {
        self.a = emptyCell().asSlice();
        self.b = null;
        self.c = emptyCell();
        self.d = null;
        self.e = beginCell();
        self.f = null;
    }
}