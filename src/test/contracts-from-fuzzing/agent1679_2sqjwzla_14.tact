contract EmptyOptionals {
    strOpt: String?;
    slOpt: Slice?;
    cellOpt: Cell?;

    init() {
        self.strOpt = null;
        self.slOpt = null;
        self.cellOpt = null;
    }
}