contract NestedOptionals {
    intOpt: Int?;
    strOpt: String?;
    boolOpt: Bool?;
    cellOpt: Cell?;

    init() {
        self.intOpt = null;
        self.strOpt = null;
        self.boolOpt = true;
        self.cellOpt = emptyCell();
    }
}