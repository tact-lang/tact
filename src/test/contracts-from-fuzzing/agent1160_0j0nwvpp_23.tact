contract LotsOfOptionals {
    intOpt: Int? = null;
    boolOpt: Bool? = null;
    strOpt: String? = null;
    addrOpt: Address? = null;
    cellOpt: Cell? = null;

    init() {
        self.intOpt = 5;
        self.boolOpt = true;
        self.strOpt = "test";
        self.addrOpt = myAddress();
        self.cellOpt = emptyCell();
    }
}