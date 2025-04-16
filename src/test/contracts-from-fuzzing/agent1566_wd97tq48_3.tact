contract ExplicitOptionals {
    intOpt: Int?;
    strOpt: String?;
    cellOpt: Cell?;
    boolOpt: Bool?;

    init() {
        self.intOpt = 5;
        self.strOpt = "hi";
        self.cellOpt = emptyCell();
        self.boolOpt = true;
    }
}
