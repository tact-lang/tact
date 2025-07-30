contract OptionalCellVariants {
    cellOpt: Cell?;
    cellFixed: Cell;

    init() {
        self.cellOpt = null;
        self.cellFixed = emptyCell();
    }
}