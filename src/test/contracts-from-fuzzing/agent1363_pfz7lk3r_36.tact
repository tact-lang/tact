contract OnlyCellAndBool {
    cfield: Cell;
    optc: Cell?;
    flag: Bool;
    optflag: Bool?;

    init() {
        self.cfield = emptyCell();
        self.optc = null;
        self.flag = false;
        self.optflag = null;
    }
}